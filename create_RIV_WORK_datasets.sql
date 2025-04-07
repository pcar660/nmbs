CREATE TABLE audience_riv_work_20250407_2 (
    hashed_email_id TEXT PRIMARY identity NAMESPACE 'hashedEmailId',
    riv_work_segment ROW (
        is_in_segment BOOLEAN,
        segment_created_date DATE
    )
) WITH (LABEL='PROFILE');
