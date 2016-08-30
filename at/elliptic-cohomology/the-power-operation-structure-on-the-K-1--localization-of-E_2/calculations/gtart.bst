% $Header: /u/levy/texts/bib/RCS/gtart.bst,v 1.13 2007/05/11 19:52:35 levy Exp levy $
%%
%% This is file `gtart.bst',
%% generated with the docstrip utility.
%%
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `ed-au,nmft,nmft-bf,dt-jnl,yr-par,xmth,yrp-x,tit-it,atit-u,jttl-rm,vnum-x,volp-blk,jdt-vs,pp-last,num-xser,numser,jnm-x,bkpg-x,pre-edn,edpar,edby-par,edbyy,blk-com,in-x,fin-bare,ppx,xedn,and-xcom,xand,eprint,url,url-blk,nfss')
%% ----------------------------------------
%% *** For Geometry and Topology Publications ***
%% 
%% Copyright 1994-1999 Patrick W Daly
%%
%% Modified by Boris Okun 12/2001
%% Modified by Silvio Levy 08/2004
%% Modified by Nicholas Jackson and Colin Rourke 08/2005
%% Small mods (\MR-->\xox{MR} etc) 01/2006 (SL/CPR)
%% mrnumber --> mrkey   CPR 8/Feb/06
%% bugfix in editor formatting (Nicholas) 26/05/06
 % ===============================================================
 % IMPORTANT NOTICE:
 % This bibliographic style (bst) file has been generated from one or
 % more master bibliographic style (mbs) files, listed above.
 %
 % This generated file can be redistributed and/or modified under the terms
 % of the LaTeX Project Public License Distributed from CTAN
 % archives in directory macros/latex/base/lppl.txt; either
 % version 1 of the License, or any later version.
 % ===============================================================
 % Name and version information of the main mbs file:
 % \ProvidesFile{merlin.mbs}[1999/03/18 3.88 (PWD)]
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in ENGLISH
 % This is a numerical citation style, and as such is standard LaTeX.
 % It requires no extra package to interface to the main text.
 % The form of the \bibitem entries is
 %   \bibitem{key}...
 % Usage of \cite is as follows:
 %   \cite{key} ==>>          [#]
 %   \cite[chap. 2]{key} ==>> [#, chap. 2]
 % where # is a number determined by the ordering in the reference list.
 % The order in the reference list is alphabetical by authors.
 %---------------------------------------------------------------------

ENTRY
  { address
    author
    booktitle
    chapter
    doi
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    url % modified by SL - now creates an href link under title
    volume
    year
% newly added by SL
    mrkey
    arxiv
    eprint
    e-print
%    zblnumber
    jfmnumber
    marginpar
    preyear % used in sorting
  }
  {}
  { label }

INTEGERS {output.state before.all mid.sentence after.sentence after.block no.punct}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'no.punct :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ duplicate$ empty$
    'pop$
    'write$
  if$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  add.blank
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

FUNCTION {bolden}
{ duplicate$ empty$
    { pop$ "" }
    { "\textbf{" swap$ * "}" * }
  if$
}

FUNCTION {quotify}
{ duplicate$ empty$
    { pop$ "" }
    { "``" swap$ * "''" * }
  if$
}


FUNCTION {bib.name.font}
{ bolden }

FUNCTION {bib.fname.font}
{ bib.name.font }
FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }

 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The language selected here is ENGLISH
FUNCTION {bbl.and}
{ "and"}

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.editors}
{ "editors" }

FUNCTION {bbl.editor}
{ "editor" }

FUNCTION {bbl.edby}
{ "edited by" }

FUNCTION {bbl.edition}
{ "edition" }

FUNCTION {bbl.volume}
{ "volume" }

FUNCTION {bbl.of}
{ "of" }

FUNCTION {bbl.number}
{ "number" }

FUNCTION {bbl.nr}
{ "no." }

FUNCTION {bbl.in}
{ "in" }

FUNCTION {bbl.pages}
{ "" }

FUNCTION {bbl.page}
{ "" }

FUNCTION {bbl.chapter}
{ "chapter" }

FUNCTION {bbl.techrep}
{ "Technical Report" }

FUNCTION {bbl.mthesis}
{ "Master's thesis" }

FUNCTION {bbl.phdthesis}
{ "PhD thesis" }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

FUNCTION {format.refnos}
{ 
  before.all 'output.state :=
  mrkey empty$
    { "" }
    { " \xox{MR}{" mrkey * "}" * }
  if$ output
%  before.all 'output.state :=
%  zblnumber empty$
%    { "" }
%    { " \xox{ZBL}{" zblnumber * "}" * }
%  if$ output
  before.all 'output.state :=
  jfmnumber empty$
    { "" }
    { " \xox{JFM}{" jfmnumber * "}" * }
  if$ output
  before.all 'output.state :=
  arxiv empty$
    { "" }
    { " \xox{arXiv}{" arxiv * "}" * }
  if$ output
  before.all 'output.state :=
  eprint empty$
    { "" }
    { " \xox{arXiv}{" arxiv * "}" * }
  if$ output  before.all 'output.state :=
  e-print empty$
    { "" }
    { " \xox{arXiv}{" arxiv * "}" * }
  if$ output
}

INTEGERS { nameptr namesleft numnames charptr}

STRINGS {i j}

FUNCTION {remove.periods}
{'i :=
 ""
 #1 'charptr :=
 " " 'j := 
 {#1 j "" =  -  } 
    {i charptr #1  substring$
    'j :=
     j "." = 
       {charptr #1 + 'charptr :=
	 i charptr #1  substring$
	 'j :=
	 j "~" =
		{"\," *}
		{j *}
	 if$}
	 {j *} 
     if$
    charptr #1 + 'charptr :=
 }
 while$
}
  
FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f }{vv~}{ll}{, jj}" format.name$
	remove.periods
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              "," *
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal *
%                  bib.name.font
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
%  t "others" =
%    'skip$
%    { bib.name.font }
%  if$
}

FUNCTION {bformat.names} % Formats names in bold, but keeps punctuation normal
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f }{vv~}{ll}{, jj}" format.name$
	remove.periods
	bib.name.font
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              "," *
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal *
%                  bib.name.font
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
%  t "others" =
%    'skip$
%    { bib.name.font }
%  if$
}

FUNCTION {format.names.ed}
{ format.names }
FUNCTION {format.authors}
{ marginpar empty$
    'skip$
    { "\bibmarginpar{" marginpar "}" * * write$ newline$ }
  if$
  author empty$
    { "" }
    { author bformat.names }
%	bib.name.font}
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor bformat.names
%	bib.name.font
      editor num.names$ #1 >
        { " (" * bbl.editors * ")" * }
        { " (" * bbl.editor * ")" * }
      if$
    }
  if$
}

FUNCTION {format.in.editors}
{ editor empty$
    { "" }
    { editor format.names.ed
    }
  if$
}

FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ *
    }
  if$
}

FUNCTION {format.title}
{ 
  title empty$
    { "" }
    { doi empty$
        {url empty$ { "" } { "\href{" url "} {" * * } if$}
        {"\href{http://dx.doi.org/" doi "} {" * * }
      if$
          title emphasize *  
      doi empty$ 
        {url empty$ 
           { "" } 
           { "}" } 
        if$
        } 
        { "}" } 
      if$ *
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {url.output}
{
  url empty$
      {}
      {
        "\ Available at \setbox0\hbox{\makeatletter\@url" write$ newline$
        "{" url * "}}" * write$ newline$
        "\href{" url * "}" * write$ newline$
        "{\unhbox0}" write$ newline$
      }
    if$
}

FUNCTION {n.dashify}
{
  't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ "from: "  }

FUNCTION {format.date}
{ year empty$
    { "" }
      'year
  if$
  duplicate$ empty$
    'skip$
    {
      before.all 'output.state :=
    " (" swap$ * ")" *
    }
  if$
}

FUNCTION{format.year}
{ year duplicate$ empty$
    { "empty year in " cite$ * warning$ pop$ "" }
    { " (" swap$ * ")" * }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.connect
      series empty$
        'skip$
        { bbl.of space.word * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.bvolume.in}
{series empty$
	'format.bvolume
	{volume empty$
		{""}
		{series " " volume * *
      	"volume and number" number either.or.check }
	if$	
    	}
if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { number }
        { output.state mid.sentence =
            { bbl.number }
            { bbl.number capitalize }
          if$
          number tie.or.space.connect
          bbl.in space.word * series *
        }
      if$
    }
      if$
    }
    { "" }
  if$
}


FUNCTION {format.number.series.in}
{ volume empty$
      {series empty$
		'format.number.series
		{series  
		number empty$
			'skip$
			{" " number * *}
		if$ }
      if$
	}
	{ "" }
if$
}



FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { edition "l" change.case$ " " * bbl.edition * }
        { edition "t" change.case$ " " * bbl.edition * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { pages n.dashify }
        { pages }
      if$
    }
  if$
}

FUNCTION {format.journal.pages}
{ pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        {
          " " *
          pages n.dashify *
        }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  format.year *
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    { "" }
    { type empty$
        { bbl.chapter }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { word.in booktitle quotify  * }
        { word.in booktitle quotify  * 
          ", (" *
          format.in.editors *
          ", " *
          editor num.names$ #1 >
            { bbl.editors }
            { bbl.editor }
          if$
          *
          ")" *
        }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bbl.techrep }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{
  key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { word.in journal emphasize  * }
      if$
    }
    { word.in key * " " *}
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$
      " " * bbl.etal *
    }
    { #2 <
        'skip$
        { editor #2 "{f }{vv }{ll}{ jj}" format.name$ "others" =
            {
              " " * bbl.etal *
            }
            { bbl.and space.word * editor #2 "{vv~}{ll}" format.name$
              * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      word.in
    }
    { bbl.volume volume tie.or.space.connect
      bbl.of space.word *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series emphasize * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { word.in "``" booktitle "''" * *  }
          if$
        }
        { word.in key * " " *}
      if$
    }
    { word.in format.crossref.editor * " " *}
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.org.or.pub}
{ 't :=
  ""
  address empty$ t empty$ and
    'skip$
    {
      t empty$
        { address empty$
          'skip$
          { address * }
          if$
        }
        { t *
          address empty$
            'skip$
            { ", " * address * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.publisher.address}
{ publisher empty$
    { "empty publisher in " cite$ * warning$
      ""
    }
    { publisher }
  if$
  format.org.or.pub
}

FUNCTION {format.organization.address}
{ organization empty$
    { "" }
    { organization }
  if$
  format.org.or.pub
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  crossref missing$
    { journal
      "journal" output.check
      add.blank
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
%      format.pages output
    }
  if$
  format.journal.pages
  format.refnos
  format.note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.edition output
      format.number.series.in output
      format.publisher.address output
    }
    {
      format.book.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  format.refnos
  format.note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  format.title "title" output.check
  howpublished output
  address output
  format.date output
  format.refnos
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume.in output
      format.edition output
      format.number.series.in output
      format.publisher.address output
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  date.block
  add.blank
  format.pages "pages" output.check
  format.refnos
  format.note output
  fin.entry
}

FUNCTION {inbook}{incollection}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume.in output
      format.number.series.in output
      publisher empty$
        { format.organization.address output }
        { organization output
          format.publisher.address output
        }
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  date.block
  add.blank
  format.pages "pages" output.check
  format.refnos
  format.note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          address output
        }
      if$
    }
    { format.authors output.nonnull }
  if$
  format.btitle "title" output.check
  author empty$
    { organization empty$
    {
          address output
        }
        'skip$
      if$
    }
    {
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  format.refnos
  format.note output
  fin.entry
  url.output
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  format.refnos
  format.note output
  fin.entry
  url.output
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  format.btitle "title" output.check
  howpublished output
  format.date output
  format.refnos
  format.note output
  fin.entry
  url.output
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  format.refnos
  format.note output
  fin.entry
  url.output
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  format.btitle "title" output.check
  format.bvolume output
  editor empty$
    { publisher empty$
        'skip$
        {
          format.number.series output
          format.publisher.address output
        }
      if$
    }
    { publisher empty$
        {
          format.organization.address output }
        {
          organization output
          format.publisher.address output
        }
      if$
     }
  if$
      format.date "year" output.check
  format.refnos
  format.note output
  fin.entry
  url.output
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  format.refnos
  format.note output
  fin.entry
  url.output
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  format.date output
  format.refnos
  format.note "note" output.check
  fin.entry
  url.output
}

FUNCTION {default.type} { misc }

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv{ } }{ll{ }} " format.name$ 
      s nameptr "{f{ }}" format.name$ #1 #1 substring$ *
      't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "zzzzz" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  preyear empty$ {""} {preyear} if$ year empty$ {""} {year} if$  * sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
% sort.key$ write$ newline$
}

ITERATE {presort}

SORT

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{}" 
  write$ newline$
  "\providecommand\bibmarginpar{\leavevmode\marginpar}" 
  write$ newline$
  "\def\urlstyle#1{{\tt #1}}"
  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `gtart.bst'.

