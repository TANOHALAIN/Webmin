Étape 1 — Installer Apache

Tout d’abord, nous devons ajouter le référentiel Webmin afin de pouvoir installer et mettre à jour Webmin à l’aide de notre gestionnaire de paquets. Nous le faisons en ajoutant le dépôt au fichier /etc/apt/sources.list.

Ouvrez le fichier dans votre éditeur préféré. Ici, nous utiliserons nano :

sudo nano /etc/apt/sources.list
Copy
Ajoutez ensuite cette ligne au bas du fichier pour ajouter le nouveau dépôt :

/etc/apt/sources.list
. . .
deb http://download.webmin.com/download/repository sarge contrib
Enregistrez le fichier et quittez l’éditeur. Si vous avez utilisé nano, faites-le en appuyant sur CTRL+X, Y, puis ENTER.

Ensuite, vous ajouterez la clé PGP Webmin afin que votre système fasse confiance au nouveau référentiel. Pour ce faire, vous devez cependant installer le paquet gnupg1 qui est l’outil de GNU pour une communication et un stockage de données sécurisés.

Mettez à jour l’index des paquets de votre serveur si vous ne l’avez pas fait récemment :

sudo apt update
Copy
Ensuite, téléchargez la clé PGP Webmin avec wget et ajoutez-la à la liste des clés de votre système :

wget -q -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add
Copy
Ensuite, mettez de nouveau à jour la liste des paquets afin d’y inclure le dépôt Webmin, désormais de confiance :

sudo apt update
Copy
Installez ensuite Webmin :

sudo apt install webmin
Copy
Une fois l’installation terminée, le résultat suivant vous sera présenté :

Output
. . .
Webmin install complete. You can now login to
https://your_server:10000 as root with your
root password, or as any user who can use sudo.
Note : Si vous avez installé et activé ufw pendant l’étape préalable, vous devrez exécuter la commande suivante afin d’autoriser Webmin à travers le pare-feu :

sudo ufw allow 10000
Copy
Pour plus de sécurité, vous pouvez configurer votre pare-feu de manière à n’autoriser l’accès à ce port qu’à partir de certaines plages d’IP.
Sécurisons l’accès à Webmin en ajoutant un certificat valide.

