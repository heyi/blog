function help () {
    echo "It is  a simple script that makes using the grunt to developing our project "
    echo ""
    echo "./install.sh app                                  --部署官网 ";
    echo "./install.sh app-charity                          --部署公益活动";
    echo "./install.sh all                                  --一起部署";
}

function deploy_app () {
		sed -ig 's/app-charity/app/g' .bowerrc; 
		git pull && grunt build -f;
}

function deplay_app_charity() {
		sed -ig 's/app\//app-charity\//g' .bowerrc; 
		git pull && grunt build -f --gruntfile Gruntfile-charity.js;
}

if [ $1 ] 
then
	if [[ $1 == 'app' ]]; then
		deploy_app;
	fi

	if [[ $1 == 'app-charity' ]]; then
		deplay_app_charity;
	fi

	if [[ $1 == 'all' ]]; then
		deploy_app;
		deplay_app_charity;
	fi
else
  help;
fi
