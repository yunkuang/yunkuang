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
�1�btool.sh �Ymo���l���[!��P���&
�&):�m{
8A@SWa���R[k
�Y��%�=��jOk�9μn��v�=ǞLMJ�����{IJ���M�/��E�9�{^�{.��9aTV�Q��s##(�%go�ѹJ�[����Hy��Ze��𨺺�k���������J��}{{��1[�b�)��%S��R'�,M~����shL'E�_���BT��0F1%A6��;w��ۼN"�"2�D�:��r�WC�3�L����Q��d��;�w����Պs�y���݋��/�vy�ף�jZ�x�������N���C$�>MtM5�^�e��e՚B�D���QN�r]�sC\��]{W�K���?�R&uֶ�O��.F��G�ʤ��֫dT_�?�V&��
�t6�2�h[C�H[�T��'�H4���J�Dtgxr����������d�����d��U��+�>�<R���$�<�l�Jt���,1u�5	P����H�]P4IT�Li�M�h�#c���F�V
�8ɉ�������$�)d�IU��,�n+.,�پ�VZ��|S��<KRQ�r�BY��DI,(\���(aD���M����L&G��]M����J_����/&��u����2�꾉O��u������ <�X�+R��+$]��`G�EXp9?���*yOp(:w���o�	x��e��Y;��������u��d��^w�}������ڳ�z�z���8>�}�r<�I'DE�"&�{Z�_�J8Ҿ�i�_��܎g�J�^�C��\k����xn�<��\b6���~��@GV1���R���6�,]a�[˄
�YY;��~�s>�p�
� �0|�������]��^�]��H@�9�7���Ѭ�[K�I"��lY��G�ō߾��÷Ћ�K�M%�ɰ��7�x�n$�a�������6l��V��f}u͞[c�8s+��c�$�yJ�x�G9[F�~D����d"m���@�.�?A�i�rKٖZ<ղX�M��Sm�tK��Ɋ�#)�)�.]��G#}�v��|U�2��Q�{�^ް�w��3��>����:�%{ች�%�ab������`���>ک�;��#���Ɖڜ���&ɨ�>�;����
��6:�7����֢�����}�}�q��z:�D̺������`,���\_{��)��ڭ���q�	�~�b.�=ja�>Pn�J�����Se���(�0���I'('��9۟ �Q��lr�lŸ#N��Ώ�.g���<t)�N~��j�X��N���_5����ՈA�3ͻ��ڐ��Х����o��&��7cR�t�d|�G�V�����,��.N&X�g����C5#qK(�t�pi���C�0�,����9	@��#>]u�B����Dɛ#�D�����|0�x�v�d�~o�~��Hc��ě_��ZO�������
e㲢���o*zG��ݟ�]}��~�e�?�h�j�3>��(�a���);��B���:F��Z����s�U�`��b�I�	D��3�Jo��U� pu�͒@	�� V�3�1F��B�d�'�����H��
jc	�nW����`������vl:�v�k+�����mg��p&0#.�`�R	N����c��>9�1\V�8|h�/��v��@Ԣ��p�$$�4N�)56�Q�x���(xE:t)A�D��5�'����K�A��i��_�����؝If^��\�B�������=���J�0=�ݮZڥљ�A����B7h=���>�h,�Z�+�5�O�Z��pq��x�;���t��ӵg3-E��o�pM��Kl[]�{˗tM�]�n���]x�hw�XW���yg�o#)~�މ�jCӠ�%� (�~�ݟK�Y��+�~�"�f��*�ӻ=z�{�V�O�{7��ϗԊ>�?�Un�|ր�
z����m�ގs�/wnP�a��/f������~���  