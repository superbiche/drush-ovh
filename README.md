# drush-ovh
Install and configure Drush on a OVH shared hosting (OVH Mutualisé).

## How to use

First, you need to setup a proxy on your client, so you can bypass OVH HTTP restrictions. 

* OSX: brew install tinyproxy  
* Windows: @todo   
* Debian/Ubuntu: @todo  
* Others: @todo  

Now setup the proxy configuration.  
If, like me, you're using TinyProxy, you can use the tinyproxy.example.conf from this repo, modify it according to your needs and overwrite the original one (usually found in /usr/local/etc/tinyproxy.conf). 

Then, you need to create a SSH tunnel between your client and your OVH hosting:  
ssh -N -R 8080:127.0.0.1:8888 \[user\]@\[IP\]

Note: when you create the tunnel, the connection seems to hang. Actually, it might not: it's probably just waiting for requests to tunnel. You can try to add the -vvv option to your ssh command, so you can check it's working. Then, open another terminal, connect with ssh in a normal way, and try to wget something. If you get the file and see some output in the tunnel window, then it's working.  


# Credits 

http://www.grappa.univ-lille3.fr/~mary/post-it/ovh_drush.php 