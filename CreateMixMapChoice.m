function partOfMixMapChoice = CreateMixMapChoice(partOfFix,partOfInsert,partDoesNotFullOf,partTemplate)

if partOfFix <= 1
    if partDoesNotFullOf == 0
        partOfMixMapChoice(1,1).mixMap = partTemplate;
    else
        partOfMixMapChoice(1,1).mixMap(1,1 : partOfInsert) = partTemplate(1,1 : partOfInsert);
    end
else
    for partOfFixIndex = 1 : partOfFix - 1
        partOfMixMapChoice(1,partOfFixIndex).mixMap = partTemplate;
    end
end
if partOfFix > 1
    if partDoesNotFullOf == 0
        partOfMixMapChoice(1,partOfFix).mixMap = partTemplate;
    else
        partOfMixMapChoice(1,partOfFix).mixMap(1,1 : partOfInsert) = partTemplate(1,1 : partOfInsert);
    end
end