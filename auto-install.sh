# Akhil Jacob
#This script will copy over configuration file and override any exisiting setup


# This is for the zsh setup ( which includes a zsh setup with automatic highlighting and fish like suggestions)
echo "This will override any existing zsh directories. Please be sure this is what you want!!"
read -p "Are you sure? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

echo "Making a plugin directory within the ~/.zsh folder..."
mkdir ~/.zsh/plugins


echo "Copying over syntax highlight and autosuggestion plugin..."
cp -r zsh-plugins/zsh-syntax-highlighting ~/.zsh/plugins
cp -r zsh-plugins/zsh-autosuggestions ~/.zsh/plugins/

# For user verification
echo "Plugin result ( Please make sure that zsh-syntax-highlighting and zsh-autosuggestions exist)"
ls ~/.zsh/plugins



fi
