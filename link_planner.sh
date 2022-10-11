fpr=com.github.alainm23.planner.flatpakref
cwd=`pwd`

cd ~
mkdir Downloads
cd ~/Downloads
curl -o ~/Downloads/$fpr https://dl.flathub.org/repo/appstream/$fpr

flatpak install --user --from com.github.alainm23.planner.flatpakref

cd ~/.var/app
mv com.github.alainm23.planner com.github.alainm23.planner_ORIG
ln -sf ~/udot/.var/app/com.github.alainm23.planner com.github.alainm23.planner

cd $cwd

