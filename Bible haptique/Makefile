PS2PDF=ps2pdf
MPOST=mpost
#FIGURES=figure1.pdf figure2.pdf
CHAPTERS=BibleHaptique.tex \
				1_Bible/Chapters/1_Sens_Sensation_Perception/0.Sens_Sensation_Perception.tex \
				      1_Bible/Chapters/1_Sens_Sensation_Perception/1.Les_sens.tex \
				      1_Bible/Chapters/1_Sens_Sensation_Perception/2.Distinction_Sensation_Perception.tex \
				      1_Bible/Chapters/1_Sens_Sensation_Perception/3.Multi_Modal.tex \
				      1_Bible/Chapters/1_Sens_Sensation_Perception/4.Illusions.tex \
				 1_Bible/Chapters/2_Sensation_Tactile/0.Sensation_Tactile.tex \
				      1_Bible/Chapters/2_Sensation_Tactile/1.Chemin.tex \
				      1_Bible/Chapters/2_Sensation_Tactile/2.Contact.tex \
				      1_Bible/Chapters/2_Sensation_Tactile/3.Transduction.tex \
				      1_Bible/Chapters/2_Sensation_Tactile/4.Spike.tex \
				      1_Bible/Chapters/2_Sensation_Tactile/5.Psychophysique.tex \
				 1_Bible/Chapters/3_Perception_Tactile/0.Perception_Tactile.tex \
				      1_Bible/Chapters/3_Perception_Tactile/1.EP.tex \
				      1_Bible/Chapters/3_Perception_Tactile/2.Dimension.tex \
				      1_Bible/Chapters/3_Perception_Tactile/3.Information_Transfer.tex \
				      1_Bible/Chapters/3_Perception_Tactile/4.Type.tex \
				 1_Bible/Chapters/4_Haptique_et_Technologie/0.Haptique_et_Technologie.tex \
				      1_Bible/Chapters/4_Haptique_et_Technologie/1.Equipement_Acquisition.tex \
				      1_Bible/Chapters/4_Haptique_et_Technologie/1.Recepteurs.tex \
				      1_Bible/Chapters/4_Haptique_et_Technologie/2.Actionneurs.tex \
				 1_Bible/Chapters/5_La_Peau/0.La_Peau.tex \
				 1_Bible/Chapters/6_Le_Systeme_Nerveux/0.Le_Systeme_Nerveux.tex 
LTX=pdflatex
BTX=bibtex

aux_folder=Aux

all: BibleHaptique.pdf

# TEX=pdfetex ?
# Hates running in parallel, adding lock semantics...
%.pdf: %.mp
	@if test -f $@; then :; else \
           trap 'rm -rf metapost.lock' 1 2 13 15; \
           until mkdir metapost.lock 2>/dev/null; do \
              sleep 0.5; \
           done; \
           rm -f $(?:.mp=.mpx) $(?:.mp=.log) $(?:.mp=.1); \
           (cd `dirname $?`; \
           TEX=latex $(MPOST) -jobname=`basename $? .mp` `basename $?`; \
           TEX=latex $(MPOST) -jobname=`basename $? .mp` `basename $?`; \
           $(PS2PDF) -dEPSCrop `basename $(?:.mp=.1)` `basename $@`); \
           rm -f $(?:.mp=.mpx) $(?:.mp=.log) $(?:.mp=.1); \
           result=0; \
           rm -rf metapost.lock; \
        fi

%.pdf: %.tex $(FIGURES) $(CHAPTERS)
	-$(LTX) -output-directory="$(aux_folder)" -shell-escape $(@:.pdf=)
	mv -f $(aux_folder)/$(@:.pdf=.log) $(aux_folder)/$(@:.pdf=.log.bak)
	-while ! cmp -s $(aux_folder)/$(@:.pdf=.log) $(aux_folder)/$(@:.pdf=.log.bak); \
        do \
           $(BTX) $(aux_folder)/$(@:.pdf=); \
           $(LTX) -output-directory="$(aux_folder)" -shell-escape $(@:.pdf=); \
           cp $(aux_folder)/$(@:.pdf=.log) $(aux_folder)/$(@:.pdf=.log.bak); \
        done
	mv -f $(aux_folder)/$(@:.pdf=.log) $(aux_folder)/$(@:.pdf=.log.bak)
	-while ! cmp -s $(aux_folder)/$(@:.pdf=.log) $(aux_folder)/$(@:.pdf=.log.bak); \
        do \
           $(LTX) -output-directory="$(aux_folder)" -shell-escape $(@:.pdf=); \
           cp $(aux_folder)/$(@:.pdf=.log) $(aux_folder)/$(@:.pdf=.log.bak); \
        done
	@-echo \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
	@-if [ -z `egrep undefined $(aux_folder)/${@:.pdf=.log}` ]; then \
	   echo "COMPILE SUCCESS - No broken references!"; \
	else \
	   egrep undefined $(aux_folder)/$(@:.pdf=.log); \
        fi
	@-if [ -z `egrep TODO $(aux_folder)/${@:.pdf=.log}` ]; then \
	   echo "NO TODOS REMAINING - No TODO sections found!"; \
	else \
	   egrep TODO $(aux_folder)/$(@:.pdf=.log); \
        fi
	@-echo \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
	@cp $(aux_folder)/$@ $@
	@open $@

.PHONY: clean
clean:
	@rm -f *.aux *.bbl *.blg *.log.bak *.log *.toc *.out *.mpx mpxerr.tex BilbleHaptique.pdf
	@rm -fr _minted-mapping
