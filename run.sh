#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��brun.sh �SM��0=ǿbJI7iN�t�*ʩҞ�j�6Q`aX�8�5Η����vӮ�R���7󞇷o����}X���	��8\+e��W"C�����bܾs�v{�E*K�eT��	܁���09>h̡�@�6P~��<�/C�|lR�X��H)�1��"���p��v	W�\�̀;<]�S6HBH��q�@$'�;� T�F���(U����ߟ�埤L���?��_Rd��"\�ף��%��/�����<$�mS!�l��+���(��}�c��#P?gc��mι�� |��̠{�jQ�Jr?��{0
4ھ}�w�����G(%��{Qh���J���Ǽ��Õ$�������Y���O�~%C��	���I]ۥ�w����RHI��<�-e{|���Mf����ї��ެ[�����~;��,�>n����k������A�5��Zp�y���OC��Ř�݀��i+Z�V���r�~�r�۷��'c5`�ʐ��y�{�  