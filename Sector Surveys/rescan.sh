#!/bin/bash

MSDIR='./Master Surveys'
GALAXY="GalacticSurvey.xml"
RESCAN="TO_RESCAN.xml"

header()
{
cat <<HEADER 
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<database application="Hazeron Scouter" version="0.3.3.4">
HEADER
}

footer()
{
cat <<FOOTER
</database>
FOOTER
}


#header >"$TMPDIR/$GALAXY"
#find . -path './$MSDIR' -prune -o -iname '*.xml' -exec grep '<body' {} \; >>"$TMPDIR/$GALAXY"
#footer >>"$TMPDIR/$GALAXY"

header >"$TMPDIR/$RESCAN"
find . -path './$MSDIR' -prune -o -iname '*.xml' -print -exec grep '<body' {} \; | grep 'outofrange="True"' >>"$TMPDIR/$RESCAN"
footer >>"$TMPDIR/$RESCAN"

#mv "$TMPDIR/$GALAXY" "$MSDIR/$GALAXY"
mv "$TMPDIR/$RESCAN" "$MSDIR/$RESCAN"


