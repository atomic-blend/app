enum MeetingLinkType {
  zoom,
  googleMeet,
  microsoftTeams,
  unknown,
}
const meetingLinkColors = {
  MeetingLinkType.zoom: 0xFF2D8CFF,
  MeetingLinkType.googleMeet: 0xFF008C45,
  MeetingLinkType.microsoftTeams: 0xFF6264A7,
};
const meetingLinkIcons = {
  MeetingLinkType.zoom: 'assets/images/zoom-meet.png',
  MeetingLinkType.googleMeet: 'assets/images/google-meet.png',
  MeetingLinkType.microsoftTeams: 'assets/images/ms-teams-meet.png',
};

class MeetingLink {
  final String url;
  final MeetingLinkType type;

  MeetingLink(this.url, this.type);
}

class MeetingLinkParser {
  // look into the content (could be a event note for example) and find the meeting link
  static MeetingLink? parse(String content) {
    final zoomRegex = RegExp(
        r'(?:(?:https?:\/\/)?(?:www\.)?zoom\.us\/(?:j|w)\/\d+|(?:https?:\/\/)?(?:www\.)?zoom\.us\/s\/\w+)');
    final googleMeetRegex = RegExp(
        r'(?:(?:https?:\/\/)?(?:meet\.google\.com|meet\.google\.com\/\w+)\/[a-zA-Z0-9]+)');
    final microsoftTeamsRegex = RegExp(
        r'(?:(?:https?:\/\/)?(?:teams\.microsoft\.com|teams\.live\.com)\/l\/meetup-join\/[a-zA-Z0-9]+)');

    Match? zoomMatch = zoomRegex.firstMatch(content);
    if (zoomMatch != null) {
      return MeetingLink(zoomMatch.group(0)!, MeetingLinkType.zoom);
    }
    
    Match? googleMeetMatch = googleMeetRegex.firstMatch(content);
    if (googleMeetMatch != null) {
      return MeetingLink(googleMeetMatch.group(0)!, MeetingLinkType.googleMeet);
    }
    
    Match? microsoftTeamsMatch = microsoftTeamsRegex.firstMatch(content);
    if (microsoftTeamsMatch != null) {
      return MeetingLink(microsoftTeamsMatch.group(0)!, MeetingLinkType.microsoftTeams);
    }
    
    return null;
  }
}
