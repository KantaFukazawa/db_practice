select
    raceno,
    events,
    groups,
    rank1,
    crew_rank1,
    rank2,
    crew_rank2,
    rank3,
    crew_rank3
from tests where
    crew_rank1 = 'A大学' or
    crew_rank2 = 'A大学' or
    crew_rank3 = 'A大学'
;
