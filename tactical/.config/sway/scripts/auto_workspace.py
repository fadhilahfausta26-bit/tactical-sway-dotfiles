#!/usr/bin/env python3
import json, os, signal, socket, struct, subprocess, time

# Matikan instance lama secara otomatis
my_pid = os.getpid()
try:
    out = subprocess.check_output(["pgrep", "-f", "auto_workspace.py"]).decode()
    for line in out.splitlines():
        pid = int(line.strip())
        if pid != my_pid:
            os.kill(pid, signal.SIGTERM)
except Exception:
    pass

sock_path = os.environ.get("SWAYSOCK")
if not sock_path:
    exit(1)

def send_msg(s, msg_type, payload=""):
    data = payload.encode("utf-8")
    header = struct.pack("=6sII", b"i3-ipc", len(data), msg_type)
    s.sendall(header + data)

def recv_msg(s):
    header = s.recv(14)
    if not header:
        return None, None
    _, length, msg_type = struct.unpack("=6sII", header)
    payload = b""
    while len(payload) < length:
        payload += s.recv(length - len(payload))
    return msg_type, json.loads(payload.decode("utf-8"))

def count_leaves(node):
    if node.get("type") == "con" and not node.get("nodes") and not node.get("floating_nodes"):
        if node.get("pid") or node.get("app_id") or node.get("window"):
            return 1
        return 0
    return sum(count_leaves(n) for n in node.get("nodes", []))

sub = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
sub.connect(sock_path)
send_msg(sub, 2, '["window"]')
recv_msg(sub)

cmd = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
cmd.connect(sock_path)

while True:
    mtype, event = recv_msg(sub)
    if event and event.get("change") == "new" and not str(event.get("container", {}).get("app_id", "")).startswith("musik-"):
        time.sleep(0.2)
        send_msg(cmd, 4) # GET_TREE
        _, tree = recv_msg(cmd)
        
        target_ws = None
        for out in tree.get("nodes", []):
            for ws in out.get("nodes", []):
                if ws.get("type") == "workspace" and ws.get("num") == 1:
                    def has_id(n, tid):
                        if n.get("id") == tid: return True
                        return any(has_id(c, tid) for c in n.get("nodes", []) + n.get("floating_nodes", []))
                    if has_id(ws, event["container"]["id"]):
                        target_ws = ws

        if target_ws and count_leaves(target_ws) > 2:
            cid = event["container"]["id"]
            send_msg(cmd, 0, f"[con_id={cid}] move container to workspace number 2; workspace number 2; layout tabbed")
            recv_msg(cmd)
