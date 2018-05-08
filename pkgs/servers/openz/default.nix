with import <nixpkgs> {};
#{ stdenv, fetchurl, postgresql, jdk, ant, tomcat85 }:


stdenv.mkDerivation rec {	

	name = "openz_${version}";
	version = "3.5.00";

	src = fetchurl { 
		url = "https://sourceforge.net/projects/openz/files/source%20distribution/${name}.tar.gz/download";
		sha1 = "71ff96126144cef1c38f70209a27436e13b9c1cd";

	};

	unpackPhase = ''
		mkdir openz
		tar xzf $src -C openz
	'';
	
	#configurePhase = ''
	#	export OPENZ_GITOSS=$PWD
	#	${postgresql}/bin/postgres
	#'';

	#buildPhase = ''
	#	psql -U postgres < create_db_openz.sql 
	#	psql -U postgres openz < openz.sql
	#	ant core.lib
	#	ant trl.lib
	#	ant wad.lib
	#	ant compile.complete
	#'';

	installPhase = ''
		cp -r openz $out
	'';

	buildInputs = [ 
	#	jdk 
	#	ant 
	#	postgresql
	#	tomcat85 
	];

	meta = with stdenv.lib; {
		description  = "Open Source ERP-Software";
		homepage = https://www.openz.de;
		maintainers = with maintainers; [ rschardt ];
		license = licenses.mpl11;
	};
}
