        CREATE TABLE audience_riv_work_20250407_1 (
            hashed_email_id TEXT PRIMARY identity NAMESPACE 'hashedEmailId',
            riv_work_segment ROW (
                is_in_segment BOOLEAN,
                segment_created_datetime datetime
            )
        ) WITH (LABEL='PROFILE');
