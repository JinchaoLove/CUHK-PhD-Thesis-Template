# Modified from [Overleaf](https://www.overleaf.com/learn/how-to/How_does_Overleaf_compile_my_project%3F)
# Reference: [thuthesis](https://github.com/tuna/thuthesis/blob/master/latexmkrc)

############
# Settings #
############
$draftmode = 0; # set to 1 for draftmode (pdflatex), 0 for final mode (xelatex)
# $silent = 1;  # suppress warnings
$show_time = 1;

$pdflatex = "pdflatex ";
$xelatex = "xelatex -no-pdf ";
$lualatex = "lualatex ";

sub set_draftmode {
  my ($tex_cmd) = @_;
  if ($draftmode) {
    # $tex_cmd .= " -draftmode";
    $pdf_mode = 1;  # 1 for pdflatex, 5 for xelatex
  } else {
    # Remove the -draftmode option if it exists
    # $tex_cmd =~ s/\s*-draftmode\b//;
    $pdf_mode = 5;  # 1 for pdflatex, 5 for xelatex
  }
  $tex_cmd .= " -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
  return $tex_cmd;
}
$pdflatex = &set_draftmode($pdflatex);
$xelatex = &set_draftmode($xelatex);
$lualatex = &set_draftmode($lualatex);


# zlib compress level (0-9) [9], lower means faster time but larger pdf
# $xdvipdfmx = "xdvipdfmx -z 0 -i dvipdfmx-unsafe.cfg -o %D %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";

# Workaround to allow pstricks transparency
$dvipdf = "dvipdf -dNOSAFER -dALLOWPSTRANSPARENCY %O %S %D";

# Configure xelatex engine
push @generated_exts, "xdv";

#########
# Clean #
#########
$bibtex_use = 1.5; # Clean bbl if exists bib (comment when submit to ArXiv)
$clean_ext = "acn acr alg aux blg brf fdb_latexmk fls glg glo gls synctex.gz hd idx ind ist lof log lot nav nls nlo lot out snm toc xdv";

###############################
# Post processing of pdf file #
###############################

# $compiling_cmd = "internal overleaf_pre_process %T %D";
# $success_cmd = "internal overleaf_post_process %T %D";
# $failure_cmd = $success_cmd;

##############
# Glossaries #
##############
add_cus_dep( 'glo', 'gls', 0, 'glo2gls' );
add_cus_dep( 'acn', 'acr', 0, 'glo2gls');  # from Overleaf v1
sub glo2gls {
    system("makeglossaries $_[0]");
}
push @generated_exts, "glg", "glo", "gls";
push @generated_exts, "acn", "acr", "alg";

#############
# makeindex #
#############
@ist = glob("*.ist");
if (scalar(@ist) > 0) {
    $makeindex = "makeindex -s $ist[0] %O -o %D %S";
}

################
# nomenclature #
################
add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
        system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}
push @generated_exts, "nlg", "nlo", "nls";
