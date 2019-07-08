library(udpipe)
library(readxl)
library(dplyr)
library(magrittr)

#load the conllu file from the directory
tb <- udpipe_read_conllu("../../Treebanks/tr-ud-train.conllu")

#make sentence ids ordinal 
tb$sentence_id %<>% as.character() %>% as.factor() %>% as.integer()

# View the data frame
# View(tb)

# Load the annotation excel sheet from the directory
modifications <- read_excel("../../Annotations/tr-ud-train-annotation.xlsx", 
                                     sheet = "Sheet 1 - Test-Dev-Conllu-Annot")

# Select and rename the columns for changes and save as a new data frame 
modifications %<>% dplyr::select(sentence_id=Sentence_ID, token=Focus_Word, changed_dep_rel=Changed_Tag, changed_head_token_id=Changed_Dependent) 

# Merge the two data frames into a new data frame
changed_tb <- left_join(tb, modifications)

# Look for any merging errors if any
dim(tb)
dim(changed_tb)

# View the new data frame
# View(changed_tb)

# view the subset of tokens with change
changes_to_make <- subset(changed_tb, !is.na(changed_dep_rel))
# View(changes_to_make)

# Define modification condition for dependency tag
change_dep_rel <- (changed_tb$changed_dep_rel != "-") & !is.na(changed_tb$changed_dep_rel)

# Define modification condition for dependency head
change_head_token_id <- (changed_tb$changed_head_token_id != "-") & !is.na(changed_tb$changed_head_token_id)

# Apply the dependency tag changes with the condition
changed_tb$dep_rel[change_dep_rel] <- changed_tb$changed_dep_rel[change_dep_rel]

# Apply the dependency head changes with the condition
changed_tb$head_token_id[change_head_token_id] <- changed_tb$changed_head_token_id[change_head_token_id]

# View the resulting data frame
# View(changed_tb)

# View the subset of changes
changes_made <- subset(changed_tb, !is.na(changed_dep_rel))
# View(changes_made)

# Remove the added columns for dependency tag and head modification
changed_tb %<>% dplyr::select(-changed_dep_rel, -changed_head_token_id)


# SECOND PART FOR NUMBERED ITEMS #
#load the conllu file from the directory
tb_modded <- changed_tb

# View the data frame
# View(tb_modded)

# Load the annotation excel sheet from the directory
modifications_2 <- read_excel("../../Annotations/tr-ud-train-annotation.xlsx", 
                              sheet = "Sheet 2 - Test-Dev-Conllu-Annot")

# Select and rename the columns for changes and save as a new data frame 
modifications_2 %<>% dplyr::select(sentence_id=Sentence_ID, token_id=Focus_Word_ID, token=Focus_Word, changed_dep_rel=Changed_Tag, changed_head_token_id=Changed_Dependent) 

modifications_2$sentence_id %<>% as.numeric()

modifications_2$token_id %<>% as.character()

# Merge the two data frames into a new data frame
changed_numbered_tb <- left_join(tb_modded, modifications_2)

# Look for any merging errors if any
dim(tb_modded)
dim(changed_numbered_tb)

# View the new data frame
# View(changed_numbered_tb)

# view the subset of tokens with change
changes_to_make_numbered <- subset(changed_numbered_tb, !is.na(changed_dep_rel))
# View(changes_to_make_numbered)

# Define modification condition for dependency tag
change_dep_rel_numbered <- (changed_numbered_tb$changed_dep_rel != "-") & !is.na(changed_numbered_tb$changed_dep_rel)

# Define modification condition for dependency head
change_head_token_id_numbered <- (changed_numbered_tb$changed_head_token_id != "-") & !is.na(changed_numbered_tb$changed_head_token_id)

# Apply the dependency tag changes with the condition
changed_numbered_tb$dep_rel[change_dep_rel_numbered] <- changed_numbered_tb$changed_dep_rel[change_dep_rel_numbered]

# Apply the dependency head changes with the condition
changed_numbered_tb$head_token_id[change_head_token_id_numbered] <- changed_numbered_tb$changed_head_token_id[change_head_token_id_numbered]

# View the resulting data frame
# View(changed_numbered_tb)

# View the subset of changes
changes_made_numbered <- subset(changed_numbered_tb, !is.na(changed_dep_rel))
# View(changes_made_numbered)

# Remove the added columns for dependency tag and head modification
changed_numbered_tb %<>% dplyr::select(-changed_dep_rel, -changed_head_token_id)

# Check typos in annotation file
notmerger_modifications <- modifications %>% dplyr::select(-changed_dep_rel, -changed_head_token_id)
notmerged <- anti_join(notmerger_modifications, changed_numbered_tb)

notmerger_modifications_2 <- modifications_2 %>% dplyr::select(-changed_dep_rel, -changed_head_token_id)
notmerged_numbered <- anti_join(notmerger_modifications_2, changed_numbered_tb)

# Save the data frame as a connlu file
changed_numbered_tb_conllu <- as_conllu(changed_numbered_tb)
#changed_numbered_tb_conllu # enable this line when you think saving as_connlu have failed.

# Export the resulting conllu file with UTF-8 Encoding
cat(changed_numbered_tb_conllu, file = file("../../Treebanks/tr-ud-train-finished.conllu", encoding = "UTF-8"))

# Export the resulting data frame as a csv file with UTF-8 Encoding
#write.csv2(changed_numbered_tb, file = file("../../Treebanks/tr-ud-train-done.csv", encoding = "UTF-8"))


# Special thanks to Pavel Logacev for this script.
# View functions are commented out for script-wise reasons
