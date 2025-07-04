#!/bin/bash
java --version || exit
# java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.2.20/unix_args.txt "$@"
java @user_jvm_args.txt -jar server.jar nogui
