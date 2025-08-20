using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoHiking.ViewModels
{
    public class TripGroupViewModel
    {
        public int mt_id { get; set; }
        public int user_id { get; set; }
        public string group_name { get; set; }
        public DateTime activity_date { get; set; }
        public string meeting_time { get; set; }
        public string meeting_location { get; set; }
        public string custom_schedule { get; set; }
        public string leader_message { get; set; }
        public int max_participants { get; set; }
        public decimal price { get; set; }

        public bool include_transport { get; set; }
        public bool include_accommodation { get; set; }
        public bool include_guide { get; set; }
        public bool include_insurance { get; set; }
        public bool include_course { get; set; }

        public TripGroupViewModel()
        {
            // 設定預設值
            include_transport = true;
            include_accommodation = true;
            include_guide = true;
            include_insurance = true;
            include_course = false;
            max_participants = 20;
            activity_date = DateTime.Now.AddDays(30);
        }
    }
}