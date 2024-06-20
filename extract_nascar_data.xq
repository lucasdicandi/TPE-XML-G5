

<nascar_data xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="nascar_data.xsd">
    <year>{data(doc("drivers_list.xml")/*:series/*:season/@year)}</year>
    <serie_type>{data(doc("drivers_list.xml")/*:series/@name)}</serie_type>
    <drivers>
    {
        for $driver in doc("drivers_list.xml")/*:series/*:season/*:driver
        let $driver_standing := doc("drivers_standings.xml")/*:series/*:season/*:driver[@id = $driver/@id]
        where exists($driver_standing/@rank)
        order by $driver/@full_name
        return
        <driver>
            <full_name>{data($driver/@full_name)}</full_name>
            <country>{data($driver/@country)}</country>
            <birth_date>{data($driver/@birthday)}</birth_date>
            <birth_place>{data($driver/@birth_place)}</birth_place>
            <rank>{data($driver_standing/@rank)}</rank>
            <car>
            {
                if (exists($driver/*:car))
                then data($driver/*:car/*:manufacturer/@name)
                else "-"
            }
            </car>
            <statistics>
                <season_points>{data($driver_standing/@points)}</season_points>
                <wins>{data($driver_standing/@wins)}</wins>
                <poles>{data($driver_standing/@poles)}</poles>
                <races_not_finished>{data($driver_standing/@dnf)}</races_not_finished>
                <laps_completed>{data($driver_standing/@laps_completed)}</laps_completed>
            </statistics>
        </driver>
    }
    </drivers>
</nascar_data>
