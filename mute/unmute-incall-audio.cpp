#include <media/ToneGenerator.h>

/*
 * For some inexplicable reason, after booting there is no in-call audio,
 * either incoming or outgoing. There is no apparent reason for this as  all 
 * devices are unmuted and have audible volumes set. 
 *
 * Curiously, the DTMF tones on the dialer keypad itself seem to activate the
 * in-call audio. This little app simply duplicates this using a very short 
 * duration DTMF tone at low volume.
 *
 * This ugly hack activates in-call voice audio.
 *
 */

using android::ToneGenerator;

int main(int argc, char *argv[])
{

	(void)argc; (void)argv;

	ToneGenerator* pToneGenerator = new ToneGenerator(AUDIO_STREAM_DTMF, 0.01, false);

	if (pToneGenerator != NULL) 
	{

		pToneGenerator->startTone(ToneGenerator::TONE_DTMF_1, 1);
		delete pToneGenerator;

	}

	return 0;
}
