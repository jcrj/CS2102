
/* cs2102 assignment 1 */

drop view if exists v1, v2, v3, v4, v5, v6, v7, v8, v9, v10 cascade;

create or replace view v1 (sid,cid) as
SELECT distinct sid, cid
FROM tutors t1
WHERE NOT EXISTS (
    SELECT 1
    FROM transcripts t2
    WHERE t2.sid = t1.sid and t2.cid = t1.cid
)
;

create or replace view v2 (sid) as
with sameYearSemester as (
    select sid, count(cid) as C
    from tutors
    group by sid, year, semester
)
select distinct sid
from sameYearSemester
where C >= 2
;

create or replace view v3 (cid, year, semester) as 
with numOfStudents as (
    select cid, year, semester, count(sid) as studentsEnrolled
    from transcripts
    group by cid, year, semester
),
maxStudentsPerCourse as (
    select cid , max(studentsEnrolled) as enrolledStudents
    from numOfStudents
    group by cid 
)
select distinct s1.cid, s1.year, s1.semester
from numOfStudents s1, maxStudentsPerCourse s2
where s1.cid = s2.cid and s1.studentsEnrolled = s2.enrolledStudents;
;

create or replace view v4 (cid, year, semester) as 
select distinct cid, year, semester
from courses c natural join offerings o
where c.did = 'cs' or o.semester = 2
union
select distinct cid, year, semester
from teaches
group by cid, year, semester
having count(pid) = 1
;

create or replace view v5 (cid) as 
with CSCourses as (
    select distinct cid
    from courses
    where did = 'cs'
), studentAlice as (
    select distinct cid
    from transcripts
    where sid = 'alice'
)
select cid
from CSCourses
except
select cid
from studentAlice
;

create or replace view v6 (cid, year, semester, cost) as
with SThours as (
    select cid, year, semester, sum(hours) * 50 as cost
    from tutors
    group by cid, year, semester
), Phours as (
    select cid, year, semester, sum(hours) * 100 as cost
    from teaches
    group by cid, year, semester
), combined as (
    select cid, year, semester, cost
    from Phours
    UNION 
    select cid, year, semester, cost
    from SThours
)
select cid, year, semester , sum(cost) as cost
from combined
group by cid, year, semester
;

/*dk how to get include 0 count*/
create or replace view v7 (did, faculty, num_admitted, num_offering, total_enrollment) as 
with admittance as (
    select did, count(*)
    from students
    where year = 2021
    group by did 
), deptByAdmittance as (
    select d.did, d.faculty, COALESCE(a.count, 0) as num_admitted
    from departments d
    left join admittance a on d.did = a.did
), deptFacAdmOff as (
    select d.did, d.faculty, d.num_admitted, COALESCE(o.count, 0) as num_offering
    from deptByAdmittance d left join (
        select did, count(*)
        from courses c natural join offerings o
        where year = 2021
        group by did
    ) o on d.did = o.did
), totalEnrollment as (
    select c.did, sum(t.count)
    from courses c right join (
        select cid, count(sid)
        from transcripts
        where year = 2021
        group by cid, year, semester
    ) t on c.cid = t.cid
    group by c.did
)
select d.*, COALESCE(t.sum, 0) as total_enrollment
from deptFacAdmOff d left join totalEnrollment t on d.did = t.did
;

create or replace view v8 (sid, year, semester) as
with csOfferings as (
    select sid, year, semester
    from transcripts natural join courses 
    where did = 'cs'
), notCSOfferings as (
    select sid, year, semester
    from transcripts natural join courses
    where did <> 'cs'
)
select *
from csOfferings
except
select *
from notCSOfferings
;

create or replace view v9 (sid, year, semester) as 
with topMarks as (
    select cid, year, semester,max(marks) as marks
    from transcripts
    group by cid, year, semester
), topStudents as (
    select distinct sid, cid, year, semester, marks
    from transcripts natural join topMarks
    order by year, semester, cid 
), notTopStudents as (
    select *
    from transcripts
    except
    select *
    from topStudents
)
select sid, year, semester
from topStudents
except
select sid, year, semester
from notTopStudents
;

create or replace view v10 (sid1, sid2, sid3, sid4) as 
with eligibleTutors as (
    select sid
    from students
    where year >= 2019
    intersect
    select sid
    from tutors
    where year = 2022 and semester = 1
    group by sid
    having sum(hours) >= 10 
), cs1andcs2 as (
    select sid
    from transcripts
    where cid = 'cs1'
    intersect
    select sid
    from transcripts
    where cid = 'cs2'
), cs3orcs4 as (
    select sid
    from transcripts
    where cid = 'cs3'
    union all 
    select sid
    from transcripts
    where cid = 'cs4'
), firstTable as ( 
    select a.sid as sid1, b.sid as sid2
    from eligibleTutors a cross join eligibleTutors b
), fullTable as (
    select *
    from (
        select distinct a.sid1 sid1, a.sid2 sid2, b.sid1 sid3, b.sid2 sid4
        from firstTable a cross join firstTable b
    ) c
    where sid4>sid3 and sid3>sid2 and sid2>sid1 
)
select *
from fullTable b
where exists (
    select 1
    from (
        (select a.sid from cs1andcs2 a where a.sid = b.sid1)
        UNION
        (select a.sid from cs1andcs2 a where a.sid = b.sid2)
        UNION 
        (select a.sid from cs1andcs2 a where a.sid = b.sid3)
        UNION 
        (select a.sid from cs1andcs2 a where a.sid = b.sid4)
    ) c
    having count(*) >= 2
) and exists (
    select 1
    from (
        (select a.sid from cs3orcs4 a where a.sid = b.sid1)
        UNION
        (select a.sid from cs3orcs4 a where a.sid = b.sid2)
        UNION 
        (select a.sid from cs3orcs4 a where a.sid = b.sid3)
        UNION 
        (select a.sid from cs3orcs4 a where a.sid = b.sid4)
    ) d
    having count(*) >= 2
)
;