import os
import argparse


"""
# copies vim files from this repo
echo 'copying .vimrc'
cp .vimrc ~/.vimrc

echo 'copying vim color schemes'
mkdir -p ~/.vim/colors
cp -r ./.vim/colors ~/.vim


# copies bash files from this repo
echo 'copying .bashrc'
cp .bashrc ~/.bashrc

echo 'copying bash aliases'
cp .bash_aliases ~/.bash_aliases


# source files



# run scripts
"""

items_list = [('vimrc', '.vimrc', '~/.vimrc'),  # name, where resides here, where resides in OS, flags
              ('vim colors', '.vim/colors', '~/.vim', 'directory'),
              ('bashrc', '.bashrc', '~/.bashrc'),
              ('bash aliases', '.bash_aliases', '~/.bash_aliases'),
              ]


def copy_out(item_to_copy):
    name = item_to_copy[0]
    src = item_to_copy[1]
    dest = item_to_copy[2]
    flags = item_to_copy[3:] if len(item_to_copy) > 3 else None

    print('diff between {} and {}:'.format(src, dest))
    diff = list(os.popen('diff {} {}'.format(src, dest)))
    for d in diff:
        print('  {}'.format(d))

    copy = input('Copy this file? (y/n) ')
    if copy == 'y':
        if flags:
            if 'directory' in flags:
                command = 'mkdir {}; cp {} {}'.format(dest, src, dest)
        else:
            command = 'cp {} {}'.format(src, dest)
        print(command)

    print('')


def load_in(item_to_copy):
    name = item_to_copy[0]
    dest = item_to_copy[1]
    src = item_to_copy[2]
    if len(item_to_copy) > 3:
        flags = item_to_copy[3:]


def main():
    parser = argparse.ArgumentParser(description="""Tool to copy dotfiles from the repo to a Linux install,
                                                    or from a Linux install into this repo""")

    direction = parser.add_mutually_exclusive_group()
    direction.add_argument('--repo_to_linux', dest='func', action='store_const', const=copy_out)
    direction.add_argument('--linux_to_repo', dest='func', action='store_const', const=load_in)
    direction.set_defaults(func=None)

    args = parser.parse_args()

    if args.func:
        for item in items_list:
            args.func(item)
    else:
        print('Specify either \'--repo_to_linux\' or \'--linux_to_repo\' as an arg!')


if __name__ == '__main__':
    main()
