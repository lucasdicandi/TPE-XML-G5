xquery version "3.0";

declare namespace ns_list = "http://feed.elasticstats.com/schema/nascar/series-v2.0.xsd";
declare namespace ns_standings = "http://feed.elasticstats.com/schema/nascar/standings-v2.0.xsd";

<nascar_data xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="nascar_data.xsd">
    <year>{data(doc("drivers_list.xml")/ns_list:series/ns_list:season/@year)}</year>
    <serie_type>{data(doc("drivers_list.xml")/ns_list:series/@name)}</serie_type>
    <drivers>
    {
        for $driver in doc("drivers_list.xml")/ns_list:series/ns_list:season/ns_list:driver
        let $driver_standing := doc("drivers_standings.xml")/ns_standings:series/ns_standings:season/ns_standings:driver[@id = $driver/@id]
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
                if (exists($driver/ns_list:car))
                then data($driver/ns_list:car/ns_list:manufacturer/@name)
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

