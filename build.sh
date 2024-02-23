FILES0="*.html"
FILES1="*/*.html"
TMP0="tmp"
TMP1="../tmp"
OS=$(uname)
[ "$OS" = "Linux" ] && SED="sed"
[ "$OS" = "OpenBSD" ] && SED="gsed"
FOOTER=$($SED -z 's/\n/\\n/g' < tpl/footer.tpl)
NAV0=$($SED -z 's/\n/\\n/g' < tpl/nav.tpl)
NAV1=$($SED -z 's/\n/\\n/g' < tpl/nav1.tpl)
HEAD0=$($SED -z 's/\n/\\n/g' < tpl/head.tpl)
HEAD1=$($SED -z 's/\n/\\n/g' < tpl/head1.tpl)

for FILE in $FILES0
do
	$SED -z "s;<footer>.*</footer>;$FOOTER;g" $FILE > $TMP0
	mv -f $TMP0 $FILE
	$SED -z "s;<header>.*<img;$NAV0;g" $FILE > $TMP0
	mv -f $TMP0 $FILE
	$SED -z "s;<head>.*</head>;$HEAD0;g" $FILE > $TMP0
	mv -f $TMP0 $FILE
done

for FILE in $FILES1
do
	$SED -z "s;<footer>.*</footer>;$FOOTER;g" $FILE > $TMP1
	mv -f $TMP1 $FILE
	$SED -z "s;<header>.*<img;$NAV1;g" $FILE > $TMP1
	mv -f $TMP1 $FILE
	$SED -z "s;<head>.*</head>;$HEAD1;g" $FILE > $TMP1
	mv -f $TMP1 $FILE
done