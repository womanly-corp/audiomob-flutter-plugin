```html
<div id="dev-content">
  <div class="doc-segment">
    <h3>
      <span style="text-decoration: underline;"
        ><strong>API Reference</strong></span
      >
    </h3>
    <p>
      This section details the API Reference of the Audiomob Android SDK to help
      you leverage its powerful features.
    </p>
  </div>
  <div class="doc-segment">
    <h2><strong>AudiomobPlugin</strong>: class</h2>
    <table style="width: 100%; height: 1424px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 50.101%; height: 35px;">
            <span style="font-weight: 400;">Name</span>
          </th>
          <th style="width: 49.8006%; height: 35px;">
            <span style="font-weight: 400;">Description</span>
          </th>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">
            initialise(apiKey: String, bundleId: String, backgroundModeEnabled:
            Boolean?)<br /><br />
          </td>
          <td style="width: 49.8006%; height: 59px;">
            Initializes the Audiomob Android SDK.
          </td>
        </tr>
        <tr style="height: 131px;">
          <td style="width: 50.101%; height: 131px;">
            <p>requestAndPlayAd(adConfiguration: AdConfiguration)</p>
          </td>
          <td style="width: 49.8006%; height: 131px;">
            <p>
              Requests an non-background audio ad and begins the ad playback as
              soon as it's ready.
            </p>
            <p>
              Accepted AdConfiguration types:<br /><em
                >RewardedBannerAdConfiguration</em
              ><br /><em>RewardedAudioOnlyAdConfiguration</em><br /><em
                >SkippableBannerAdConfiguration</em
              ><br /><em>SkippableAudioOnlyAdConfiguration</em>
            </p>
          </td>
        </tr>
        <tr style="height: 68px;">
          <td style="width: 50.101%; height: 68px;">
            <p>requestAndPlayAd()</p>
          </td>
          <td style="width: 49.8006%; height: 68px;">
            <p>
              Requests a background audio ad and begins the ad playback as soon
              as it's ready.
            </p>
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">pauseLifeCycle()</td>
          <td style="width: 49.8006%; height: 59px;">
            Pauses the SDK's lifecycle, call this method when the app goes into
            the background (non-background ads only).
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">pauseLifeCycle()</td>
          <td style="width: 49.8006%; height: 59px;">
            Pauses the SDK's lifecycle, call this method when the app goes into
            the background (non-background ads only).
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">resumeLifeCycle()</td>
          <td style="width: 49.8006%; height: 59px;">
            Resumes the SDK's lifecycle, call this method when the app comes
            into the foreground (non-background ads only).
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 50.101%; height: 35px;">release()</td>
          <td style="width: 49.8006%; height: 35px;">
            Releases resources used by Audiomob, ensure to call this function
            when the context is destroyed.
          </td>
        </tr>
        <tr style="height: 60px;">
          <td style="width: 50.101%; height: 60px;">
            setCallbacks(observer: IAudiomobCallback)
          </td>
          <td style="width: 49.8006%; height: 60px;">
            Subscribes the given observer to Audiomob's callbacks.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 50.101%; height: 35px;">
            removeCallbacks(observer: IAudiomobCallback)
          </td>
          <td style="width: 49.8006%; height: 35px;">
            Unsubscribes the given observer from Audiomob's public callbacks.
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">
            <p>getAdAvailability(placement: Placement)&nbsp;</p>
          </td>
          <td style="width: 49.8006%; height: 59px;">
            Starts the asynchronous call to get the AdAvailability information.
            For background mode ads, always pass <em>Placement.REWARDED</em>.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 50.101%; height: 35px;">pauseAd()</td>
          <td style="width: 49.8006%; height: 35px;">
            Pauses the playing audio ad.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 50.101%; height: 35px;">resumePausedAd()</td>
          <td style="width: 49.8006%; height: 35px;">
            Resumes the paused audio ad.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 50.101%; height: 35px;">stopAd()</td>
          <td style="width: 49.8006%; height: 35px;">
            Stops the audio ad playback.
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">
            hasAdBegunPlaying(): Boolean
          </td>
          <td style="width: 49.8006%; height: 59px;">
            Returns true if the ad playback is in progress.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 50.101%; height: 35px;">isAdPaused(): Boolean</td>
          <td style="width: 49.8006%; height: 35px;">
            Return true if the ad is paused.
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">
            getTimeRemaining(): Float
          </td>
          <td style="width: 49.8006%; height: 59px;">
            Returns the seconds remaining for the ad that is currently playing.
          </td>
        </tr>
        <tr style="height: 34px;">
          <td style="width: 50.101%; height: 28px;">forceTestAds: Boolean</td>
          <td style="width: 49.8006%; height: 28px;">
            If set as true, the server will return test ads even if live ads are
            enabled on the dashboard.
          </td>
        </tr>
        <tr style="height: 83px;">
          <td style="width: 50.101%; height: 83px;">
            sendGeoLocation: Boolean
          </td>
          <td style="width: 49.8006%; height: 83px;">
            If set as true, and user has given the permission, SDK will fetch
            latitude and longitude and send in ad request.
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 50.101%; height: 59px;">
            sendAdvertisingId: Boolean
          </td>
          <td style="width: 49.8006%; height: 59px;">
            Sets whether or not to send the user's Android Advertising Id with
            the ad request if it's available.
          </td>
        </tr>
        <tr style="height: 133px;">
          <td style="width: 50.101%; height: 133px;">
            sendAndroidIdAsAFallback: Boolean
          </td>
          <td style="width: 49.8006%; height: 133px;">
            Sets whether or not to send the Android ID as a fallback ID if the
            Android Advertising Id is not available.
          </td>
        </tr>
        <tr style="height: 84px;">
          <td style="width: 50.101%; height: 84px;">
            doNotSendAnyDeviceIdsForNonConsentedUsers: Boolean
          </td>
          <td style="width: 49.8006%; height: 84px;">
            Sets whether or not to not send any device ID in the ad request if
            the Android Advertising Id is not available.
          </td>
        </tr>
        <tr style="height: 60px;">
          <td style="width: 50.101%; height: 60px;">
            sendConsentStrings: Boolean
          </td>
          <td style="width: 49.8006%; height: 60px;">
            Sets whether or not to send consent strings set by a Consent
            Management Platform or in SharedPreferences.
          </td>
        </tr>
        <tr style="height: 60px;">
          <td style="width: 50.101%; height: 60px;">
            onlySendContextualSignals: Boolean
          </td>
          <td style="width: 49.8006%; height: 60px;">
            Sets whether or not to only send contextual signals in the ad
            request.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>AdRequestResult</strong>: enum</h2>
    <table style="width: 100%; height: 185px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 30.9205%; height: 35px;">Name</th>
          <th style="width: 68.9812%; height: 35px;">Description</th>
        </tr>
        <tr style="height: 10px;">
          <td style="width: 30.9205%; height: 10px;">FINISHED</td>
          <td style="width: 68.9812%; height: 10px;">
            The audio ad request completed as an audio ad is ready to play.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 30.9205%; height: 35px;">NO_AD_AVAILABLE</td>
          <td style="width: 68.9812%; height: 35px;">
            There was no ad found for this user.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 30.9205%; height: 35px;">FREQUENCY_CAP_REACHED</td>
          <td style="width: 68.9812%; height: 35px;">
            The user has reached the maximum number of ads for this session.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 30.9205%; height: 35px;">FAILED</td>
          <td style="width: 68.9812%; height: 35px;">
            The audio ad request failed due to an error.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 30.9205%; height: 35px;">
            SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE
          </td>
          <td style="width: 68.9812%; height: 35px;">
            The skippble ad was not requested as the device volume is not
            audible.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>AdPlaybackResult</strong>: enum</h2>
    <table style="width: 100%; height: 205px;">
      <tbody>
        <tr style="height: 34px;">
          <th style="width: 30.9029%; height: 34px;">Name</th>
          <th style="width: 68.9737%; height: 34px;">Description</th>
        </tr>
        <tr style="height: 34px;">
          <td style="width: 30.9029%; height: 34px;">FINISHED</td>
          <td style="width: 68.9737%; height: 34px;">
            The audio ad playback has finished (the user can now be given a
            reward).
          </td>
        </tr>
        <tr style="height: 34px;">
          <td style="width: 30.9029%; height: 34px;">STOPPED</td>
          <td style="width: 68.9737%; height: 34px;">
            The audio ad was stopped by the ‘stopAd’ function.
          </td>
        </tr>
        <tr style="height: 34px;">
          <td style="width: 30.9029%; height: 34px;">FAILED</td>
          <td style="width: 68.9737%; height: 34px;">
            The audio ad playback failed due to an error.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 30.9029%; height: 35px;">CANCELED</td>
          <td style="width: 68.9737%; height: 35px;">
            The ad was canceled by the user before it started.
          </td>
        </tr>
        <tr style="height: 34px;">
          <td style="width: 30.9029%; height: 34px;">SKIPPED</td>
          <td style="width: 68.9737%; height: 34px;">
            The audio ad playback was skipped by the user.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>IAudiomobCallback</strong>: interface</h2>
    <table style="width: 100%; height: 600px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 40.476%; height: 35px;">Name</th>
          <th style="width: 59.4257%; height: 35px;">Description</th>
        </tr>
        <tr style="height: 10px;">
          <td style="width: 40.476%; height: 10px;">onAdRequestStarted()</td>
          <td style="width: 59.4257%; height: 10px;">
            The audio ad request has started.
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 40.476%; height: 59px;">
            onAdRequestCompleted(AdRequestResult adRequestResult, AudioAd
            result)
          </td>
          <td style="width: 59.4257%; height: 59px;">
            The audio ad request completed as an audio ad is ready to play.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 40.476%; height: 35px;">
            onAdPlaybackStarted(AudioAd result)
          </td>
          <td style="width: 59.4257%; height: 35px;">
            The audio ad playback has started.
          </td>
        </tr>
        <tr style="height: 59px;">
          <td style="width: 40.476%; height: 59px;">
            onAdPlaybackCompleted(AdPlaybackResult adPlaybackResult)
          </td>
          <td style="width: 59.4257%; height: 59px;">
            The audio ad playback has finished (the user can now be given a
            reward). AdPlaybackResult enum will value will notify the Finshed,
            Skipped, Failed, Stopped status of playback.
          </td>
        </tr>
        <tr style="height: 195px;">
          <td style="width: 40.476%; height: 195px;">
            onAdPlaybackPaused(PauseAdEnum pauseReason)
          </td>
          <td style="width: 59.4257%; height: 195px;">
            <p>The audio ad playback is paused when the:</p>
            <p>
              App is in the background<br />Device volume is below the required
              threshold<br />User has paused the ad playback<br />Audio focus is
              released
            </p>
          </td>
        </tr>
        <tr style="height: 171px;">
          <td style="width: 40.476%; height: 171px;">onAdPlaybackResumed()</td>
          <td style="width: 59.4257%; height: 171px;">
            <p>Audio ad playback is resumed when the:</p>
            <p>
              App is in the foreground<br />Device volume is increased either
              through the unmute prompt or manually raising the volume<br />User
              has resumed the app
            </p>
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 40.476%; height: 36px;">
            onAdAvailabilityRetrieved(ADAvailability result)
          </td>
          <td style="width: 59.4257%; height: 36px;">
            The ad availability request completed and has Ad Availability
            object.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>AdAvailability</strong>: class</h2>
    <table style="width: 100%; height: 175px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 35.8812%; height: 35px;">Name</th>
          <th style="width: 64.0508%; height: 35px;">Description</th>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 35.8812%; height: 35px;">adsAvailable: Boolean?</td>
          <td style="width: 64.0508%; height: 35px;">
            An estimation of whether or not you will receive ads in this region.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 35.8812%; height: 35px;">
            estimatedRevenue: Float?
          </td>
          <td style="width: 64.0508%; height: 35px;">
            &nbsp;Estimated revenue for an ad (if an impression is detected).
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 35.8812%; height: 35px;">estimatedCpm: Float?</td>
          <td style="width: 64.0508%; height: 35px;">
            Estimated Cost Per Thousand Impressions for an ad (if an impression
            is detected).
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 35.8812%; height: 35px;">geo: String?</td>
          <td style="width: 64.0508%; height: 35px;">
            The ISO 3166 alpha-2 country code of the region the user is in.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>RewardedBannerAdConfiguration</strong>: class</h2>
    <table>
      <tbody>
        <tr>
          <th>Name</th>
          <th>Description</th>
        </tr>
        <tr>
          <td>banner: BannerConfiguration</td>
          <td>This class which has banner size and placeholder.</td>
        </tr>
        <tr>
          <td>unmutePrompt: UnmutePromptConfiguration</td>
          <td>
            This class has unmute prompt view, text , raise volume button/view
            and stop Ad Button/View.
          </td>
        </tr>
        <tr>
          <td>countdownConfiguration: CountdownConfiguration</td>
          <td>This class has count down timer text and filler progress bar.</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>RewardedAudioOnlyAdConfiguration</strong>: class</h2>
    <table style="width: 100%; height: 105px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 61.1607%; height: 35px;">Name</th>
          <th style="width: 38.7554%; height: 35px;">Description</th>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 61.1607%; height: 35px;">
            unmutePrompt: UnmutePromptConfiguration
          </td>
          <td style="width: 38.7554%; height: 35px;">
            This class has unmute prompt view, text, raise volume button/view
            and stop Ad Button/View.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 61.1607%; height: 35px;">
            countdownConfiguration: CountdownConfiguration
          </td>
          <td style="width: 38.7554%; height: 35px;">
            This class has count down timer text and filler progress bar.
          </td>
        </tr>
        <tr>
          <td style="width: 61.1607%;">adPlayingNotice: View</td>
          <td style="width: 38.7554%;">
            A View which is displayed instead of banner when Audio Only Ad
            plays.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>SkippableBannerAdConfiguration</strong>: class</h2>
    <table style="width: 100%; height: 105px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 60.6638%; height: 35px;">Name</th>
          <th style="width: 39.2523%; height: 35px;">Description</th>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 60.6638%; height: 35px;">
            banner: BannerConfiguration
          </td>
          <td style="width: 39.2523%; height: 35px;">
            This class which has banner size and placeholder.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 60.6638%; height: 35px;">
            countdownConfiguration: CountdownConfiguration
          </td>
          <td style="width: 39.2523%; height: 35px;">
            This class has count down timer text and filler progress bar.
          </td>
        </tr>
        <tr>
          <td style="width: 60.6638%;">skipButton: View</td>
          <td style="width: 39.2523%;">A View to display skip icon.</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>SkippableAudioOnlyAdConfiguration</strong>: class</h2>
    <table style="width: 100%; height: 70px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 61.2479%; height: 35px;">Name</th>
          <th style="width: 38.6683%; height: 35px;">Description</th>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 61.2479%; height: 35px;">
            countdownConfiguration: CountdownConfiguration
          </td>
          <td style="width: 38.6683%; height: 35px;">
            This class has count down timer text and filler progress bar.
          </td>
        </tr>
        <tr>
          <td style="width: 61.2479%;">skipButton: View</td>
          <td style="width: 38.6683%;">A View to display skip icon.</td>
        </tr>
        <tr>
          <td style="width: 61.2479%;">adPlayingNotice: View</td>
          <td style="width: 38.6683%;">
            A View which is displayed instead of banner when Audio Only Ad
            plays.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>UnmutePromptConfiguration</strong>: class</h2>
    <table>
      <tbody>
        <tr>
          <th>Name</th>
          <th>Description</th>
        </tr>
        <tr>
          <td>unmutePrompt: View</td>
          <td>
            A View or Layout which holds all the view of
            UnmutePromptConfiguration class.
          </td>
        </tr>
        <tr>
          <td>promptText: TextView</td>
          <td>TextView to display unmute text.</td>
        </tr>
        <tr>
          <td>raiseVolumeButton: View</td>
          <td>A Button/View to raise volume.</td>
        </tr>
        <tr>
          <td>stopAdButton: View</td>
          <td>A Button/View to stop the Ad.</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>BannerConfiguration</strong>: class</h2>
    <table>
      <tbody>
        <tr>
          <th>Name</th>
          <th>Description</th>
        </tr>
        <tr>
          <td>bannerSize: BannerSize</td>
          <td>
            Enum which has Banner Size for Rectangle and LeaderBoard banners.
          </td>
        </tr>
        <tr>
          <td>bannerImage: ShapeableImageView</td>
          <td>A place holder for banners.</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>AudioAd</strong>: class</h2>
    <table style="width: 100%; height: 175px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 33.4349%; height: 35px;">Name</th>
          <th style="width: 66.4971%; height: 35px;">Description</th>
        </tr>
        <tr>
          <td style="width: 33.4349%;">id: String</td>
          <td style="width: 66.4971%;">The unique id of this audio ad.</td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 33.4349%; height: 35px;">estimatedCpm: Float</td>
          <td style="width: 66.4971%; height: 35px;">
            Estimated Cost Per Thousand Impressions for this ad (if an
            impression is detected).
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 33.4349%; height: 35px;">
            estimatedRevenue: Float
          </td>
          <td style="width: 66.4971%; height: 35px;">
            Estimated revenue for an ad (if an impression is detected).
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 33.4349%; height: 35px;">duration: Float</td>
          <td style="width: 66.4971%; height: 35px;">
            The duration of the ad.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 33.4349%; height: 35px;">
            companionBanner: CompanionBanner?
          </td>
          <td style="width: 66.4971%; height: 35px;">
            The companion banner for this audio ad, if one was requested.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="doc-segment">
    <h2><strong>CompanionBanner</strong>: interface</h2>
    <table style="width: 100%; height: 140px;">
      <tbody>
        <tr style="height: 35px;">
          <th style="width: 33.4349%; height: 35px;">Name</th>
          <th style="width: 66.4971%; height: 35px;">Description</th>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 33.4349%; height: 35px;">
            bannerSize: BannerSize?
          </td>
          <td style="width: 66.4971%; height: 35px;">
            The size of the companion banner.
          </td>
        </tr>
        <tr style="height: 35px;">
          <td style="width: 33.4349%; height: 35px;">image: Bitmap?</td>
          <td style="width: 66.4971%; height: 35px;">
            The bitmap graphic of the companion banner.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
```
