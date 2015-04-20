function partOfMixMapChoice = CreateMixMapChoice(partOfMixMapChoice,partOfFix,partOfInsert,partDoesNotFullOf,partTemplate)

if partOfFix == 1
    if partDoesNotFullOf == 0
        partOfMixMapChoice(1,1).mixMap = partTemplate;
    else
        partOfMixMapChoice(1,1).mixMap(1,partOfInsert) = partTemplate(1,partOfInsert);
    end
else
    partOfMixMapChoice(1,1:partOfFix-1).mixMap = partTemplate;
end
if partOfFix ~= 1
    if partDoesNotFullOf == 0
        partOfMixMapChoice(1,partOfFix).mixMap = partTemplate;
    else
        partOfMixMapChoice(1,partOfFix).mixMap(1,partOfInsert) = partTemplate(1,partOfInsert);
    end
end