# Derivation for adi1090x's battery-wallpaper 

with import <nixpkgs>{};

stdenv.mkDerivation rec {
  pname = "bwall";
  version = "2.0";

  src = fetchFromGitHub {
    owner = "adi1090x";
    repo = "battery-wallpaper";
    rev = "422dd1f323a2c810972aaa5f9c21c7cfd69573ed";
    sha256 = "01w12cbfrykakz1rl2marsmndhwmrhy8v4dad81fi3qas0xij1zn";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/battery-wallpaper
    mkdir -p $out/bin
    cp -r images $out/share/battery-wallpaper && cp -r bwall.sh $out/share/battery-wallpaper
    sed -i 's,/usr/share/battery-wallpaper/images,'"$out"'/share/battery-wallpaper/images,' "$out/share/battery-wallpaper/bwall.sh"
    chmod +x $out/share/battery-wallpaper/bwall.sh
    ln -s $out/share/battery-wallpaper/bwall.sh $out/bin/bwall
  '';

  meta = with lib; {
    homepage = "https://github.com/adi1090x/battery-wallpaper/";
    description = " Simple bash script to set wallpaper according to battery percentage with charging animations";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
