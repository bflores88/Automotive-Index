CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars;

--49 ms no index
select distinct make_title
from car_models
where make_code = 'LAM';

--34 ms no index
select distinct model_title
from car_models
where make_code = 'NISSAN'
and model_code = 'GT-R';

--32 ms no index
select make_code, model_code, model_title, year
from car_models
where make_code = 'LAM';

--309 ms no index
select *
from car_models
where year between 2010 and 2015;

--91 ms no index
select *
from car_models
where year = 2010;

CREATE INDEX IX
ON car_models (make_code, model_code);

--5 ms
select distinct make_title
from car_models
where make_code = 'LAM';

--6 ms
select distinct model_title
from car_models
where make_code = 'NISSAN'
and model_code = 'GT-R';

--7 ms
select make_code, model_code, model_title, year
from car_models
where make_code = 'LAM';

--337 ms
select *
from car_models
where year between 2010 and 2015;

--117 ms
select *
from car_models
where year = 2010

--Queries #4 & #5 are not running faster because the years are not indexed.