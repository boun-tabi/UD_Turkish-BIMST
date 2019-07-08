# load the neccassary packages
library(udpipe)
library(readxl)
library(dplyr)
library(magrittr)

#load the conllu file from the directory
tb <- udpipe_read_conllu("../../Treebanks/tr-ud-dev.conllu")

#make sentence ids ordinal 
tb$sentence_id %<>% as.character() %>% as.factor() %>% as.integer()

# View the data frame
# View(tb)

# Load the annotation excel sheet from the directory
modifications <- read_excel("../../Annotations/tr-ud-dev-annotation.xlsx", 
                                      sheet = "annotation - Test-Dev-Conllu-An")


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
modifications_2 <- read_excel("../../Annotations/tr-ud-dev-annotation.xlsx", 
                              sheet = "numbered - Test-Dev-Conllu-Anno")

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

# Save the data frame as a connlu file
#changed_numbered_tb_conllu <- as_conllu(changed_numbered_tb)
#changed_numbered_tb_conllu

# load the done test real to a data frame
tb_nmod <- changed_numbered_tb

# load the excel modifier to a data frame
advcl_modifier <- read_excel("../../Annotations/tr-ud-dev-added-advcl-annotation.xlsx", sheet = "Sheet 1 - tb_dev_svd", col_types = c("numeric", "text", "numeric", "text", "text"))

tb_nmod$sentence_id %<>% as.numeric()

advcl_modifier$token_id %<>% as.character

# join two data frames
tb_nmod_advcl_modifier <- left_join(tb_nmod, advcl_modifier)

# set the modifier condition
change_dep_rel <- !is.na(tb_nmod_advcl_modifier$changed_dep_rel)

# make the changes
tb_nmod_advcl_modifier$dep_rel[change_dep_rel] <- tb_nmod_advcl_modifier$changed_dep_rel[change_dep_rel]

# remove the modifier column
tb_nmod_advcl_modifier %<>% dplyr::select(-changed_dep_rel)

# Check typos in annotation file
notmerger_modifications <- modifications %>% dplyr::select(-changed_dep_rel, -changed_head_token_id)
notmerged <- anti_join(notmerger_modifications, changed_numbered_tb)

notmerger_modifications_2 <- modifications_2 %>% dplyr::select(-changed_dep_rel, -changed_head_token_id)
notmerged_numbered <- anti_join(notmerger_modifications_2, changed_numbered_tb)

notmerger_advcl_modifier <- advcl_modifier %>% dplyr::select(-changed_dep_rel, -dep_rel)
notmerged_advcl_modifier <- anti_join(notmerger_advcl_modifier, tb_nmod_advcl_modifier)


# save the data frame as a conllu file
tb_nmod_advcl_modifier_conllu <- as_conllu(tb_nmod_advcl_modifier)
tb_nmod_advcl_modifier_conllu


# Export the resulting conllu file with UTF-8 Encoding
cat(tb_nmod_advcl_modifier_conllu, file = file("../../Treebanks/tr-ud-dev-finished.conllu", encoding = "UTF-8"))


# Special thanks to Pavel Logacev for this script.
# View functions are commented out for script-wise reasons
