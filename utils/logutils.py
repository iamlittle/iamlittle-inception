import sys

__log_level = "DEBUG"

def log(msg):
    global __log_level
    if("DEBUG" in __log_level):
        sys.stdout.write(msg)
        sys.stdout.flush()
