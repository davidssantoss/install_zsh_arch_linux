# JASTICZSH 
Just another scrip to install and "customize" zsh in
* Arch Linux and derivates(beta). 
* Debian and derivates (beta)
* rpm and independent distros SOON!
Hope it helps you!!

```
   _           _   _              _     
  (_) __ _ ___| |_(_) ___ _______| |__  
  | |/ _` / __| __| |/ __|_  / __| '_ \ 
  | | (_| \__ \ |_| | (__ / /\__ \ | | |
 _/ |\__,_|___/\__|_|\___/___|___/_| |_|
|__/                                    
... just another script to install and customizate zsh
```

## Run bash script

To run the script you just need **bash** or another **shell** and type:

```
sh install.sh
```

or
```
bash install.sh
```

## Example of the jasticzsh script


![jasticzsh](https://raw.githubusercontent.com/devsantoss/jasticzsh-media/master/jasticzsh.gif)

**Note: The script will do:**

1. **Install zsh**

2. **If you want you can add customizations to your zsh**
    * **You can install ohmyzsh**
    * **You can install ohmyzsh and powerlevel10k theme**

3. **Change your default shell to zsh**

4. **At the end if you choose 'y' or 'Y' you will log out your session to apply changes after you login open your terminal**

### Docker Testing (Beta)
Use Docker compose to test the script
Build the image and detach from the default output
```
$ docker-compose up -d --build
```

And then attach to the container
```
$ docker-compose exec jasticzsh /bin/bash
```

Now you can run the script **(on the container)**
```
[root@someId /]# sh jasticzsh/install.sh
```

Once the script has finished run `exec` to see the changes
```
$ exec zsh
```
Happy testing! 🐋