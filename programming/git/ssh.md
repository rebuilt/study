# Check for existing ssh keys
Keys are stored in ~/.ssh/

If a key is there, it can be used, if not, generate a new one

# Generate a new key 
ssh-keygen -t ed25519 -C "memoryman51@hotmail.com"

Give the file a name.  Keep it at default or linux ssh-agent will fail to sign in.  

Enter a passphrase

# Add keys to the ssh-agent

Start the agent in the background
```bash
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```

Add private key
```
$ ssh-add ~/.ssh/id_ed25519
```

# Connect to server


