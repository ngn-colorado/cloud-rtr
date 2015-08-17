#!/usr/bin/python

manifest_file = open("default.xml", 'r')
manifest_file_out = open("default.xml.out", 'w')

for line in manifest_file:
    tokens = line.split(" ")
    isAOSP = True
    for i in range(len(tokens)):
	token = tokens[i]
	if token.startswith("remote="):
		isAOSP = False
		break
    if isAOSP:
	    for i in range(len(tokens)):
         	token = tokens[i]
	        if token.startswith("name="):
        	    new_name_token = token.replace("-", "/")
	            tokens[i] = new_name_token
    new_line = " ".join(tokens)
    manifest_file_out.write(new_line)


