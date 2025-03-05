# Homework 1

This repository contains:
1. skripta.sh - A bash script
1. fix.log - A log file sed to test our script

Script’s purpose is to parse input FIX log file and extract information about all child orders for one parent order.

## Script Call

The script can be called in the terminal by simply writing its name, it requires to forward 2 arguments of wich the first one is a **.log** file specificly the Fix.log file, the second argument is the parentId of the order that the Algo engine creates.
**EXAMPLE of the script call:** `skripta.sh Fix.log SoMePareNtIDIHave**`

## Script’s job

The script takes the fix.log and the parentId we forward it, and uses them to extract the child orders that are connected to or parent order. After it extracts all child orders it will generate an **output.log** file that contains all the parents main child orders and their last status(paraphrased in words for easier understanding) on the market.Statuses varry as orders can be:
1.     Fully filled(39=2)
1.     Partially filled(39=1)       
1.     Cancled(by user or unsolicited, 39=4)
1.     Expired(39=C)
1.     Newly created (39=0)
1.     etc...

So instead of some **massive** and "random" tags that the Fix.log provides us, that are hard to decode without a FIX manual by hand this script will give us an output like: 
```
 Parent order TVRQH+tkb03GTlG0ZM4HBIvRAw**
1. RPm4Qw56TJq20eM1LWVQfw** - pending cancel
2. HIYnIKgnQcmXqn3qDtzMRA** - fully filled in 1015000 ns
3. UVn0M7E8TbCW2dqF00qIjA** - new, 3000 quantity
4. zlZmEh+9QuOzrB8/FKaUAA** - partially filled, 100 executed and 900 remaining
```
Which is easier for everyone to grasp because it gives us the child's ID and its status in words that everybody can understand and therefore see what happened to it!

## Script faliures 

The script will _**refuse**_ to run if:
-     No arguments are provided example : skripta.sh
-     Fewer than 2  arguments provided example:  skripta.sh fix.log" or "skripta.sh InCkA187XAAw1+UAVWT**
-     More than 2 arguments are provided example:  skripta.sh fix.log 1 2 3 4
-     Providing a .log file or any file that does not exists!
-     The first arguments is not a .log file example : skripta.sh fix.txt InCkA187XAAw1+UAVWT**

