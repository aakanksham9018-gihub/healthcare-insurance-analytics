Healthcare Insurance Analytics SQL Queries

1. Total Members Enrolled
SQL> Select count(*) as total_member
  2  from members;


2. Active vs Inactive Members
SQL> Select status, count(*) as member_count
  2  from members
  3  group by status;


3. Claims Status Breakdown
SQL> Select status as claim_status, count(*) as total_claims
  2  From claims
  3  group by status;


4. Total Claim Amount by Hospital
SQL> Select  hospital, sum(amount) as total_claim_amount
  2  from claims
  3  group by hospital
  4  order by total_claim_amount desc;


5. Approval Rate
SQL> Select round (sum
  2  (case
  3  when status = 'Approved' then 1 else 0 end) * 100/count (*),
  4  2) as approval_rate
  5  from claims;


6. Member + Claims Analysis (JOIN)
SQL> Select m.member_id, m.name, m.age, m.plan_type,c.claim_id, c.amount, c.status
  2  from members m
  3  join claims c
  4  on m.member_id = c.member_id;


7. High Value Claims (>5000)
SQL> Select member_id, sum(amount) as total_claim_amount
  2  from claims
  3  group by member_id
  4  having sum(amount) > 5000;

8. Eligibility Validation
SQL> Select m.member_id, m.name, e.eligibility_status, c.claim_id, c.amount
  2  from members m
  3  join eligibility e
  4  on m.member_id = e.member_id
  5  left join claims c
  6  on m.member_id = c.member_id;