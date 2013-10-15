#!/usr/bin/python
# -*- coding: utf-8 -*- 
# Script for symlinking in dotfiles-repo
# Øystein Hiåsen

import os
import datetime
files_to_symlink = ['vimrc', 'gitconfig', 'tmux.conf']

home_folder = os.path.expanduser('~') 
dotfiles_repo = os.path.join(home_folder, ".dotfiles") 
source_path = os.path.join(dotfiles_repo, '%s') # Path to source of symlink
symlink_path= os.path.join(home_folder, ".%s") # path of symlink


def symlink_dotfiles(files_to_symlink):
    backup_folder_created = False
    backup_folder = os.path.join(home_folder, "dotfiles_backup_%s" % datetime.datetime.now().isoformat())

    for filename in files_to_symlink:
        source = source_path % filename
        symlink = symlink_path % filename

        if os.path.exists(symlink):
            if os.path.islink(symlink):
                os.remove(symlink)
            else:
                if not backup_folder_created:
                    create_backup_folder(backup_folder)
                    backup_folder_created = True
                print("Backing up old %s" % filename)
                os.rename(symlink, os.path.join(backup_folder, filename))

        print("Creating symlink for %s" % filename)
        os.symlink(source , symlink)
    print("Finished symlinking")


def create_backup_folder(backup_folder):
    print("Creating folder to backup existing dotfiles: %s" % backup_folder)
    os.mkdir(backup_folder)
    f = open(os.path.join(backup_folder, 'README'), 'w')
    text = "This folder was created by hiasens dotfiles symlinker."
    f.write(text)
    f.close()



if __name__ == '__main__':
    import sys
    if len(sys.argv) > 1:
        symlink_dotfiles(sys.argv[1:])
    else:
        symlink_dotfiles(files_to_symlink)

