#!/usr/bin/python
# -*- coding: utf-8 -*- 
# Script for symlinking in dotfiles-repo
# Øystein Hiåsen

import os
import datetime

class DotfileSymlinker(object):
    backup_folder_created = False

    def __init__(self, files, home_folder=None, dotfiles_repo=None):
        self.files = files
        self.home_folder = home_folder or os.path.expanduser('~')
        self.dotfiles_repo = dotfiles_repo or os.path.expanduser('~/.dotfiles')
        self.backup_folder = os.path.join(
                self.home_folder,
                "dotfiles_backup_{}".format(datetime.datetime.now().isoformat()))


    def symlink_all(self):
        for path in self.files:
            self.symlink_one(path)
        print("Finished symlinking")

    def symlink_one(self, path):
        folder, filename = os.path.split(path)
        source = os.path.join(self.dotfiles_repo, "{}".format(path))
        symlink = os.path.join(self.home_folder, ".{}".format(path))

        self.remove_if_symlink(symlink)
        try:
            self.backup_file(symlink)
        except:
            pass

        if folder:
            try:
                os.makedirs(os.path.join(self.home_folder, ".{}".format(folder)))
                print("Created parent folder: .{}".format(folder))
            except :
                pass

        print("Symlinking {} -> {}".format(symlink, source))
        os.symlink(source , symlink)

    def remove_if_symlink(self, filename):
        if os.path.exists(filename) and os.path.islink(filename):
            os.remove(filename)

    def backup_file(self, filename):
        if not os.path.exists(filename):
            return
        if not self.backup_folder_created:
            self.create_backup_folder()
        print("Backing up old %s" % filename)
        os.rename(filename, os.path.join(self.backup_folder, filename))

    def create_backup_folder(self):
        print("Creating folder to backup existing dotfiles: %s" % self.backup_folder)
        if not self.backup_folder_created:
            os.mkdir(self.backup_folder)
            self.backup_folder_created = True
            f = open(os.path.join(self.backup_folder, 'README'), 'w')
            text = "This folder was created by hiasens dotfiles symlinker."
            f.write(text)
            f.close()


if __name__ == '__main__':
    import sys
    if len(sys.argv) > 1:
        files_to_symlink = sys.argv[1:]
    else:
        f = open('symlink_list', 'r')
        files_to_symlink = [x.strip() for x in f]
        f.close()
    symlinker = DotfileSymlinker(files_to_symlink)
    symlinker.symlink_all()

