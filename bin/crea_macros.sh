# Crea Macros_hmm con el resultado del proto del HCompV para cada simbolo

head -3 hmm/hmm_0/proto > hmm/hmm_1/Macros_hmm
cat hmm/hmm_0/vFloors >> hmm/hmm_1/Macros_hmm
for i in $(< Lista_Simbolos); do
  tail -n +4 hmm/hmm_0/proto | sed "s/proto/$i/g" >> hmm/hmm_1/Macros_hmm
done
