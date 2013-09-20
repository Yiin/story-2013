#include <a_samp>

forward A_Difference_Second ( one_s, two_s );
forward A_Difference_Minute ( one_m, two_m );
forward A_Difference_Hour ( one_h, two_h );
forward A_Difference_Day ( one_d, two_d );
forward A_Difference_Month ( one_mt, two_mt );
forward A_Difference_Year ( one_y, two_y );

forward A_DifferenceDate ( &d_year, &d_month, &d_day, &d_hour, &d_minute, &d_seconds );
forward A_ExpireDate ( year, month, day, hour, min, sec );
forward A_CalculateDate ( {_}:... );

stock
	A_LastSecond,          	A_BeforeSecond,
	A_LastMinute,          	A_BeforeMinute,
	A_LastHour,            	A_BeforeHour,
	A_LastDay,             	A_BeforeDay,
	A_LastMonth,           	A_BeforeMonth,
	A_LastYear,            	A_BeforeYear;

stock
	bool:                   D_S,
	bool:                   D_M,
	bool:                   D_H,
	bool:                   D_D,
	bool:                   D_MT,
	bool:                   D_Y;

public A_Difference_Second ( one_s, two_s )
{
	if ( ( one_s >= 0 && one_s <= 60 ) && ( two_s >= 0 && two_s <= 60 ) )
	{
    	A_LastSecond = one_s, A_BeforeSecond = two_s;
    	D_S = true;
    	return 0;
	} else return 1;
}

public A_Difference_Minute ( one_m, two_m )
{
	if ( ( one_m >= 0 && one_m <= 60 ) && ( two_m >= 0 && two_m <= 60 ) )
	{
    	A_LastMinute = one_m, A_BeforeMinute = two_m;
    	D_M = true;
    	return 0;
	} else return 1;
}

public A_Difference_Hour ( one_h, two_h )
{
	if ( ( one_h >= 0 && one_h <= 23 ) && ( two_h >= 0 && two_h <= 23 ) )
	{
    	A_LastHour = one_h, A_BeforeHour = two_h;
    	D_H = true;
    	return 0;
	} else return 1;
}

public A_Difference_Day ( one_d, two_d )
{
	if ( ( one_d >= 0 && one_d <= 31 ) && ( two_d >= 0 && two_d <= 31 ) )
	{
    	A_LastDay = one_d, A_BeforeDay = two_d;
    	D_D = true;
    	return 0;
	} else return 1;
}

public A_Difference_Month ( one_mt, two_mt )
{
	if ( ( one_mt >= 0 && one_mt <= 12 ) && ( two_mt >= 0 && two_mt <= 12 ) )
	{
    	A_LastMonth = one_mt, A_BeforeMonth = two_mt;
    	D_MT = true;
    	return 0;
	} else return 1;
}


public A_Difference_Year ( one_y, two_y )
{
	if ( one_y >= 0 && two_y >= 0 )
	{
    	A_LastYear = one_y, A_BeforeYear = two_y;
    	D_Y = true;
    	return 0;
	} else return 1;
}

stock D_Completed ( )
{
	if ( ( D_S == true ) && ( D_M == true ) && ( D_H == true ) && ( D_D == true ) && ( D_MT == true ) && ( D_Y == true ) ) { return 0; }
	return 1;
}

public A_DifferenceDate ( &d_year, &d_month, &d_day, &d_hour, &d_minute, &d_seconds )
{
	if ( D_Completed ( ) == 0 ) {
		d_year = A_LastYear - A_BeforeYear;
		d_month = A_LastMonth - A_BeforeMonth;
		d_day = A_LastDay - A_BeforeDay;
		d_hour = A_LastHour - A_BeforeHour;
		d_minute = A_LastMinute - A_BeforeMinute;
		d_seconds = A_LastSecond - A_BeforeSecond;

		if ( d_year < 0 ) { d_month--; d_year = -d_year; }
		if ( d_month < 0 ) { d_day--; d_month = -d_month; }
		if ( d_day < 0 ) { d_hour--; d_day = -d_day; }
		if ( d_hour < 0 ) { d_minute--; d_hour = -d_hour; }
		if ( d_minute < 0 ) { d_seconds--; d_minute = -d_minute; }
		if ( d_seconds < 0 ) { d_seconds = -d_seconds; }
		} else return 2;
	return 1;
}

public A_CalculateDate ( {_}:... )
{
	new
	    num = numargs(),
	    DATA 	[ 6 ],
	    DATA2	[ 6 ],
	    SecondResult = 0,
	    SecondFinalResult = 0,
	    MinuteResult = 0,
	    MinuteFinalResult = 0,
	    HourResult = 0,
		HourFinalResult = 0,
		DayResult = 0,
		DayFinalResult = 0,
		MonthResult = 0,
		MonthFinalResult = 0,
		YearFinalResult = 0;

	getdate ( DATA [ 0 ], DATA [ 1 ], DATA [ 2 ] ), gettime ( DATA [ 3 ], DATA [ 4 ], DATA [ 5 ] );

	for ( new i = 0; i < 6; i++ ) { DATA2 [ i ] = 0; }

	if ( num > 6 ) { print ( "CalculateDate! You can not place more than 6 arguments." ); return 1; }

	if ( getarg ( 5, 0 ) > 60 ) { print ( "CalculateDate! You can not place more than 60 seconds." ); return 1; }
    SecondResult = DATA [ 5 ] + getarg ( 5, 0 );
    SecondFinalResult = SecondResult;
    if ( SecondResult > 59 )
    {
        DATA2 [ 4 ] = 1;
        SecondFinalResult = SecondResult - 60;
    }
 	setarg(5, 0, SecondFinalResult);

	if ( getarg ( 4, 0 ) > 60 ) { print ( "CalculateDate! You can not place more than 60 minutes." ); return 1; }
	MinuteResult = DATA [ 4 ] + getarg ( 4, 0 ) + DATA2 [ 4 ];
	MinuteFinalResult = MinuteResult;
    if ( MinuteResult > 59 )
    {
        DATA2 [ 3 ] = 1;
        MinuteFinalResult = MinuteResult - 60;
    }
	setarg(4, 0, MinuteFinalResult);

	if ( getarg ( 3, 0 ) > 24 ) { print ( "CalculateDate! You can not place more than 24 hours." ); return 1; }
    HourResult = DATA [ 3 ] + getarg ( 3, 0) + DATA2 [ 3 ];
    HourFinalResult = HourResult;
    if ( HourResult > 23 )
    {
        DATA2 [ 2 ] = 1;
        HourFinalResult = HourResult - 24;
    }
 	setarg(3, 0, HourFinalResult);

	if ( getarg ( 2, 0 ) > 31 ) { print ( "CalculateDate! You can not place more than 31 days." ); return 1; }
    DayResult = DATA [ 2 ] + getarg ( 2, 0 ) + DATA2 [ 2 ];
    DayFinalResult = DayResult;
    if ( DATA [ 1 ] == 2 && DayResult > 29 )
    {
        DATA2 [ 1 ] = 1;
		DayFinalResult = DayResult - 29;
    }
    if ( ( DATA [ 1 ] == 4 && DayResult > 30 ) || ( DATA [ 1 ] == 6 && DayResult > 30 ) || ( DATA [ 1 ] == 9 && DayResult > 30 ) || ( DATA [ 1 ] == 11 && DayResult > 30 ) )
    {
        DATA2 [ 1 ] = 1;
        DayFinalResult = DayResult - 30;
    }
    if ( DayResult > 31 )
    {
        DATA2 [ 1 ] = 1;
        DayFinalResult = DayResult - 31;
    }
	setarg(2, 0, DayFinalResult);

	if ( getarg ( 1, 0 ) > 12 ) { print ( "CalculateDate! You can not place more than 12 months." ); return 1; }
	MonthResult = DATA [ 1 ] + getarg ( 1, 0 ) + DATA2 [ 1 ];
    MonthFinalResult = MonthResult;
    if ( MonthResult > 12 )
    {
        DATA2 [ 0 ] =1;
        MonthFinalResult = MonthResult - 12;
    }
    setarg(1, 0, MonthFinalResult);

    YearFinalResult = DATA [ 0 ] + getarg ( 0, 0 ) + DATA2 [ 0 ];
	setarg(0, 0, YearFinalResult);

	return true;
}

public A_ExpireDate ( year, month, day, hour, min, sec )
{
	new
	    A_DATE [ 6 ];
	getdate ( A_DATE [ 0 ], A_DATE [ 1 ], A_DATE [ 2 ] ), gettime ( A_DATE [ 3 ], A_DATE [ 4 ], A_DATE [ 5 ] );

	if ( ( year > A_DATE [ 0 ] ) || ( year == A_DATE [ 0 ] && month > A_DATE [ 1 ] ) || \
	( year == A_DATE [ 0 ] && month == A_DATE [ 1 ] && day > A_DATE [ 2 ] ) || \
	( year == A_DATE [ 0 ] && month == A_DATE [ 1 ] && day == A_DATE [ 2 ] && hour > A_DATE [ 3 ] ) || \
	( year == A_DATE [ 0 ] && month == A_DATE [ 1 ] && day == A_DATE [ 2 ] && hour == A_DATE [ 3 ] && min > A_DATE [ 4 ] ) ||
	( year == A_DATE [ 0 ] && month == A_DATE [ 1 ] && day == A_DATE [ 2 ] && hour == A_DATE [ 3 ] && min == A_DATE [ 4 ] && sec > A_DATE [ 5 ] ) ) { return 0; }
	return 1;
}

stock A_FormatTime ( year, month, day, hour, min, sec )
{
	new text3 [ 72 ];
	if ( year > 0 ) {
	    new text2 [ 13 ];
	    format ( text2, sizeof ( text2 ), "years: %d", year );
	    strcat ( text3, text2 );
	    if ( month > 0 ) { strcat ( text3, ", " ); }
	}
	if ( month > 0 ) {
	    new text2 [ 13 ];
	    format ( text2, sizeof ( text2 ), "months: %d", month );
	    strcat ( text3, text2 );
	    if ( day > 0 ) { strcat ( text3, ", " ); }
	}
	if ( day > 0 ) {
	    new text2 [ 11 ];
	    format ( text2, sizeof ( text2 ), "days: %d", day );
	    strcat ( text3, text2 );
	    if ( hour > 0 ) { strcat ( text3, ", " ); }
	}
	if ( hour > 0 ) {
	    new text2 [ 12 ];
	    format ( text2, sizeof ( text2 ), "hours: %d", hour );
	    strcat ( text3, text2 );
	    if ( min > 0 ) { strcat ( text3, ", " ); }
	}
	if ( min > 0 ) {
	    new text2 [ 11 ];
	    format ( text2, sizeof ( text2 ), "minutes: %d", min );
	    strcat ( text3, text2 );
	}
	if ( sec > 0 ) {
		new text2 [ 11 ];
		format ( text2, sizeof ( text2 ), "seconds: %d", sec );
		strcat ( text3, text2 );
	}
	return text3;
}