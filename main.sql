SELECT pilot.pilot_id, pilot.name
FROM pilot JOIN flight
ON pilot.pilot_id = flight.second_pilot_id
WHERE (flight.flight_dt BETWEEN '2022-08-01' AND '2022-08-31') AND flight.destination = 'Шереметьево'
GROUP BY pilot_id
HAVING COUNT(pilot_id) = 3;

SELECT pilot.pilot_id, pilot.name
FROM pilot JOIN flight
ON pilot.pilot_id = flight.first_pilot_id OR pilot.pilot_id = flight.second_pilot_id
JOIN plane on flight.plane_id = plane.plane_id
WHERE pilot.age > 45 AND plane.cargo_flg = 0 AND flight.quantity > 30;


SELECT pilot.pilot_id, pilot.name, COUNT(flight.flight_id)
FROM pilot JOIN flight ON pilot.pilot_id = flight.first_pilot_id
JOIN plane ON flight.plane_id = plane.plane_id
WHERE plane.cargo_flg = 1 AND (flight.flight_dt BETWEEN '2022-01-01' AND '2022-12-31')
GROUP BY pilot.pilot_id
ORDER BY COUNT(flight.flight_id) DESC
LIMIT 10;

