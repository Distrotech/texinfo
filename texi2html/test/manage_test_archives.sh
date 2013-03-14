#! /bin/sh

user=pertusus

command=$1

if [ "z$command" = 'z' ]; then
  echo "Need something to do (pack/packt2h/unpack/get/clean/upload)"
  exit 1
fi
shift;

download_dir="download-mirror.savannah.gnu.org/releases/texinfo"

if [ z"$1" != 'z' ]; then
  VERSION=$1
  shift
else
  VERSION=`grep '^VERSION = ' ../../Makefile | sed 's/^VERSION = *//'`
fi

if [ z"$VERSION" = 'z' ]; then
  echo "Cannot find version"
  exit 1
fi

if [ z"$1" != 'z' ]; then
  user=$1
fi

tp_tests_name=tp_tests_results-$VERSION
texi2html_tests_name=t2h_tests_results
#manuals=t2h_tests_big_manuals

if [ $command = 'packt2h' ]; then
  rm -f $texi2html_tests_name.tar.gz #$manuals.tar.gz
  (
  cd ..
  tar c --exclude-vcs -z -f test/$texi2html_tests_name.tar.gz test/*/res/ test/*/res_all/ test/*/res_info/ test/*/res_html/ test/*/res_docbook/ test/*/res_xml/ test/many_input_files/*_res/
  #tar c --exclude-vcs -z -f test/$manuals.tar.gz test/manuals/*.texi test/tar_manual/*.texi test/singular_manual/*.tex* test/singular_manual/d2t_singular/
  )
elif [ $command = 'pack' ]; then
  rm -f $tp_tests_name.tar.gz
  (
  cd ..
  tar c --exclude-vcs -z -f test/$tp_tests_name.tar.gz test/*/res_parser*/
  )
elif [ $command = 'get' ]; then :
  wget -N -r -np -A '*.tar.gz*' http://$download_dir/ || exit 1
  for file in $texi2html_tests_name $tp_tests_name; do
    if [ -f  $download_dir/$file.tar.gz ]; then
      cp -a $download_dir/$file.tar.gz ..
    else
      echo "WARNING: missing $download_dir/$file.tar.gz" 1>&2
    fi
  done
elif [ $command = 'clean' ]; then
  rm -rf download-mirror.savannah.gnu.org
  rm -f $texi2html_tests_name.tar.gz $tp_tests_name.tar.gz
  rm -f ../$texi2html_tests_name.tar.gz ../$tp_tests_name.tar.gz
elif [ $command = 'unpack' ]; then
  (
  cd ..
  for file in $texi2html_tests_name $tp_tests_name; do
    if [ -f $file.tar.gz ]; then
      tar x -z -f $file.tar.gz
    else
      echo "WARNING: missing $file.tar.gz" 1>&2
    fi
  done
  #tar x -z -f test/$manuals.tar.gz

  )
  for dir in */; do
    if [ -f "$dir/htmlxref.cnf-texinfo" ]; then
      mkdir -p $dir/.texinfo/
      cp -p "$dir/htmlxref.cnf-texinfo" $dir/.texinfo/
    fi
    if [ -f "$dir/htmlxref.cnf-ref" ]; then
      cp -p "$dir/htmlxref.cnf-ref" $dir/htmlxref.cnf
    fi
  done
  cp -p sectioning/renamednodes.cnf-ref sectioning/equivalent_nodes-noderename.cnf
elif [ $command = 'upload' ]; then
  mkdir -p ../upload
  #cp -a $texi2html_tests_name.tar.gz upload
  #gpg -b --use-agent upload/$texi2html_tests_name.tar.gz
  cp -a $tp_tests_name.tar.gz ../upload
  gpg -b --use-agent ../upload/$tp_tests_name.tar.gz
  rsync -a -essh ../upload/ $user@dl.sv.gnu.org:/releases/texinfo/
else
  echo "Unknown command (pack/packt2h/unpack/get/clean/upload)"
  exit 1
fi

