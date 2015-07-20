default:
	ocamlbuild extractionBigInt.cma extractionBigInt.cmxa -use-ocamlfind -package num

install: default
	ocamlfind install extraction-big-int META _build/extractionBigInt.cmi _build/extractionBigInt.cmx _build/extractionBigInt.a _build/extractionBigInt.cma _build/extractionBigInt.cmxa _build/extractionBigInt.mllib

uninstall:
	ocamlfind remove extraction-big-int

clean:
	ocamlbuild -clean
