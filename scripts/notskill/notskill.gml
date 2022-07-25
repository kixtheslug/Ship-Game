function NotSkill(){
	dashing = false
	cloaked = false
	if(skillDuration<skillMaxDuration) skillDuration += skillRegen;
	else if (skillDuration> skillMaxDuration) skillDuration = skillMaxDuration //make sure there cant be overflow
	else canUseSkill = true //only runs if skillDuration = skillMaxDuration
}