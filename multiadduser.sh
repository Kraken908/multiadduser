#This small, but powerful program will create five user accounts, assign random passwords (generated by the tr -dc A-Za-z0-9_ < /dev/urandom | head -c 12 | xargs command line) to each account, and assigns password aging rules to each of the new accounts. Notice that the passwords are placed in the /root/password file for the root user to provide to the new users (note that this script needs to be executed as the root user).
#What makes this program even more powerful is that it can be so flexible. For example, instead of putting the new user account names in the script itself, they could be gathered from user input:


#this file has 3 various kinds of scripts and it's not executable 

#!/bin/bash                                                                     
echo -e "User\tPassword" > /root/password                                       
echo -e "----\t--------" >> /root/password                                      
                                                                                
read -p "Enter account names separated by spaces: " accounts
for name in $accounts                                               
do                                                                              
    useradd $name                                                               
    pw=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 12 | xargs)                 
    echo -e "$name:\t$pw" >> /root/password                                     
    echo $pw | passwd --stdin $name                                             
    chage -M 90 -m 5 -W 10 $name                                                
done

#!/bin/bash                                                                     
echo -e "User\tPassword" > /root/password                                       
echo -e "----\t--------" >> /root/password                                      
                                                                                
for name in ted fred ned jed bob                                                
do                                                                              
    useradd $name                                                               
    pw=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 12 | xargs)                 
    echo -e "$name:\t$pw" >> /root/password                                     
    echo $pw | passwd --stdin $name                                             
    chage -M 90 -m 5 -W 10 $name                                                
done

#!/bin/bash                                                                     
echo -e "User\tPassword" > /root/password                                       
echo -e "----\t--------" >> /root/password                                      
                                                                                
for name in `cat /root/users`                                                
do                                                                              
    useradd $name                                                               
    pw=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 12 | xargs)                 
    echo -e "$name:\t$pw" >> /root/password                                     
    echo $pw | passwd --stdin $name                                             
    chage -M 90 -m 5 -W 10 $name                                                
done
