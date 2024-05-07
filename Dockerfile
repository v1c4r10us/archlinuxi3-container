FROM archlinux/archlinux

RUN pacman -Syyu --noconfirm
RUN pacman -S i3 alacritty ttf-iosevka-nerd neovim rofi picom neovim bat lsd tigervnc feh git nodejs npm base-devel go net-tools lsd firefox --noconfirm

RUN useradd -m z3r0 \
    && usermod -aG wheel z3r0 \
    && chmod 600 /etc/sudoers \
    && echo '%wheel ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && echo ':1=z3r0' >> /etc/tigervnc/vncserver.users
COPY i3/i3status.conf /etc/i3status.conf
RUN mkdir /home/z3r0/data \
    && chown z3r0 /home/z3r0/data

USER z3r0
RUN cd /home/z3r0 && git clone https://aur.archlinux.org/yay-git.git \
    && cd /home/z3r0/yay-git && makepkg -si --noconfirm \
    && mkdir /home/z3r0/.vnc \
    && echo '1234abcd' | vncpasswd -f > /home/z3r0/.vnc/passwd \
    && chmod 600 /home/z3r0/.vnc/passwd
RUN mkdir /home/z3r0/.config \
    && mkdir /home/z3r0/.config/i3 \
    && mkdir /home/z3r0/.config/alacritty

COPY i3/config /home/z3r0/.config/i3/config
COPY vnc/config /home/z3r0/.vnc/config
COPY alacritty/alacritty.toml /home/z3r0/.config/alacritty/alacritty.toml
COPY wallpaper.jpg /home/z3r0/.config/i3/wallpaper.jpg

RUN yay -S novnc --noconfirm
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

COPY bashrc/.bashrc /home/z3r0/.bashrc
RUN git clone https://github.com/LazyVim/starter /home/z3r0/.config/nvim
