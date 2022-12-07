tool
extends Node2D

func parse_raw_commands(f):
	var content = Util.file_content(str("res://src/2022/07/", f))

	var raw_cmds = content.split("$ ", false)
	var trimmed = []
	for raw in raw_cmds:
		trimmed.append(raw.strip_edges())

	return trimmed

func update_cwd(cmd, cwd):
	var dir = cmd.split(" ", false)[1]
	if dir == "..":
		cwd.pop_back()
	elif dir == "/":
		cwd = ["/"]
	else:
		cwd.append(dir)

	return cwd

func dir_list_to_str(ds):
	return "/".join(ds)

func handle_ls(cmd, cwd, dirs_state):
	var ls_results = Array(cmd.split("\n", false))
	ls_results.pop_front()

	var dirs = []
	var files_size = 0
	for l in ls_results:
		var sp = l.split(" ", false)
		var a = sp[0]
		var b = sp[1]
		if a == "dir":
			var d = cwd.duplicate()
			d.append(b)
			dirs.append(d)
		else:
			files_size += int(a)

	dirs_state[dir_list_to_str(cwd)] = {"size": files_size, "dirs": dirs}

func build_dir_structure(cmds):
	var cwd = []
	var dirs_state = {}
	for c in cmds:
		var cmd = c.substr(0, 2)
		match cmd:
			"cd": cwd = update_cwd(c, cwd)
			"ls": handle_ls(c, cwd, dirs_state)

	return dirs_state

func calc_dir_size(dirs_state, dir_path):
	var dir = dirs_state[dir_path]
	var files_size = dir["size"]

	var nested_size = 0
	for d in dir["dirs"]:
		var p = dir_list_to_str(d)
		nested_size += calc_dir_size(dirs_state, p)

	return files_size + nested_size

func set_dir_sizes(dirs_state):
	for dir_path in dirs_state.keys():
		var dir_size = calc_dir_size(dirs_state, dir_path)
		dirs_state[dir_path]["dir_size"] = dir_size

	return dirs_state

func parse_dir_sizes(f="input.txt"):
	var cmds = parse_raw_commands(f)

	var dirs_state = build_dir_structure(cmds)

	dirs_state = set_dir_sizes(dirs_state)

	return dirs_state

func sum_dirs_under_size(dirs, n=100000):
	var sum = 0
	for dir_path in dirs.keys():
		var d = dirs[dir_path]
		if d["dir_size"] <= n:
			sum += d["dir_size"]
	return sum

func smallest_dir_to_delete(dirs, needed=30000000, total=70000000):
	var root_size = dirs["/"]["dir_size"]
	var unused_space = total - root_size
	var required_deletion = needed - unused_space

	var smallest = root_size
	for dir_path in dirs:
		var d = dirs[dir_path]
		var s = d["dir_size"]
		if s >= required_deletion and s < smallest:
			smallest = s

	return smallest

func _ready():
	if Engine.editor_hint:
		request_ready()

	# print(parse_dir_sizes("example.txt"))
