FILES0="*.html"
FILES1="*/*.html"
FILES2="posts/*.html"
FILES4=$(ls posts | grep .ms| sed s/.ms//)
TMP0="tmp"
TMP1="../tmp"
FOOTER=$(sed -z 's/\n/\\n/g' < tpl/footer.tpl)
NAV0=$(sed -z 's/\n/\\n/g' < tpl/nav.tpl)
NAV1=$(sed -z 's/\n/\\n/g' < tpl/nav1.tpl)
POSTHEAD=$(sed -z 's/\n/\\n/g' < tpl/posthead.tpl)
HEAD0=$(sed -z 's/\n/\\n/g' < tpl/head.tpl)
HEAD1=$(sed -z 's/\n/\\n/g' < tpl/head1.tpl)

for f in $FILES4
do
groff -ms posts/$f.ms -Thtml > posts/$f.html
done

for FILE in $FILES0
do
	sed -z "s;<footer>.*</footer>;$FOOTER;g" $FILE > $TMP0
	mv -f $TMP0 $FILE
	sed -z "s;<header>.*<img;$NAV0;g" $FILE > $TMP0
	mv -f $TMP0 $FILE
	sed -z "s;<head>.*</head>;$HEAD0;g" $FILE > $TMP0
	mv -f $TMP0 $FILE
done

for FILE in $FILES1
do
	sed -z "s;<footer>.*</footer>;$FOOTER;g" $FILE > $TMP1
	mv -f $TMP1 $FILE
	sed -z "s;<header>.*<img;$NAV1;g" $FILE > $TMP1
	mv -f $TMP1 $FILE
	sed -z "s;<head>.*</head>;$HEAD1;g" $FILE > $TMP1
	mv -f $TMP1 $FILE
done

for FILE in $FILES2
do
	sed -z "s;<head>.*</style>;$POSTHEAD;g" $FILE > $TMP1
	mv -f $TMP1 $FILE
done