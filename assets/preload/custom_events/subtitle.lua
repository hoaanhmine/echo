-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'subtitle' then
		setTextString("subtitleText", value1);
	end
end