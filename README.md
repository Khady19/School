# School
Ce projet est une application Web Java Enterprise Edition (Java EE) qui permet de gérer les inscriptions, les cours et les étudiants d'une école
# Fonctionnalités
Inscription d'étudiants à l'école
Ajout de cours disponibles
Inscription d'étudiants à des cours
Visualisation des cours auxquels un étudiant est inscrit
Visualisation des étudiants inscrits à un cours
Modification des informations des étudiants
Suppression des étudiants, des cours et des inscriptions
#Technologies utilisées
Java Enterprise Edition (Java EE)
Enterprise JavaBeans (EJB)
Java Persistence API (JPA)
Servlets et JSP (JavaServer Pages)
HTML, CSS et JavaScript
Xidfly server
MySQL Database
# Configuration
Assurez-vous que le serveur Wildfly est installé et configuré correctement sur votre machine
Créez une base de données MySQL nommée "school" (vous pouvez modifier le nom de la base de données dans le fichier persistence.xml)
Exécutez le script SQL fourni dans le dossier "sql" pour créer les tables nécessaires dans la base de données
Déployez le fichier WAR de l'application sur le serveur Wildfly
Assurez-vous que le module de base de données JDBC pour MySQL est installé sur le serveur Wildfly (vous pouvez télécharger le module depuis le site de MySQL et l'installer en suivant les instructions fournies par Wildfly)
Configurez la connexion à la base de données dans le fichier persistence.xml en utilisant le nom d'utilisateur et le mot de passe appropriés pour accéder à la base de données MySQL
# Utilisation
Accédez à l'application à l'URL http://localhost:8080/school/
Utilisez le formulaire d'inscription pour ajouter des étudiants à l'école
Utilisez le formulaire d'ajout de cours pour ajouter des cours à l'école
Utilisez les pages "Inscription aux cours" et "Liste des cours" pour inscrire les étudiants à des cours et voir les cours auxquels les étudiants sont inscrits
Utilisez les pages "Liste des étudiants" et "Modifier étudiant" pour voir la liste des étudiants inscrits et modifier leurs informations
Utilisez les boutons de suppression pour supprimer les étudiants, les cours et les inscriptions
