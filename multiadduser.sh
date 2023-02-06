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
