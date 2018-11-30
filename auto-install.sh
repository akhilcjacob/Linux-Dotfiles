# Akhil Jacob
#This script will copy over configuration file and override any exisiting setup


# This is for the zsh setup ( which includes a zsh setup with automatic highlighting and fish like suggestions)
echo "Installing ZSH files"
echo "======================"
echo "This will override any existing zsh directories. Please be sure this is what you want!!"
read -p "Are you sure? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

cp .zshrc ~/
echo "Making a plugin directory within the ~/.zsh folder..."
mkdir ~/.zsh/plugins

echo "Copying over syntax highlight and autosuggestion plugin..."
cp -r zsh-plugins/zsh-syntax-highlighting ~/.zsh/plugins
cp -r zsh-plugins/zsh-autosuggestions ~/.zsh/plugins/



echo ""
# For user verification
echo "Plugin result ( Please make sure that zsh-syntax-highlighting and zsh-autosuggestions exist)"
ls ~/.zsh/plugins
fi


echo ""
echo ""
# This is for the ROFI setup ( which is a dark themed app launcher )
echo "Installing ROFI Files"
echo "======================"
echo "This will override any existing zsh directories. Please be sure this is what you want!!"
read -p "Are you sure? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
mv rofi ~/.config/rofi
fi

echo ""
echo ""
# This is for the i3 setup ( Setup for i3 wm - please look at .config/i3/config for keybindings)
echo "Installing i3 wm Files"
echo "======================"
echo "This will override any existing zsh directories. Please be sure this is what you want!!"
read -p "Are you sure? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
mv i3 ~/.config/
fi

echo ""
echo ""
# This is for the i3 setup ( Setup for i3 wm - please look at .config/i3/config for keybindings)
echo "Installing i3 wm Files"
echo "======================"
echo "This will override any existing compton files. Please be sure this is what you want!!"
read -p "Are you sure? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
mv compton.conf ~/.config/
fi